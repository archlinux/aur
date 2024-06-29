# Maintainer: tirip <tirip@duck.com>
pkgname=brother-mfc8950dw
pkgver=3.0.0
pkgrel=1
pkgdesc="Brother MFC-8950DW LPD and CUPS driver"
arch=('i686' 'x86_64')
url="https://download.brother.com/"
license=('custom:brother')
depends=('cups' 'ghostscript' 'gsfonts' 'lib32-glibc')
source=("https://download.brother.com/welcome/dlf006425/mfc8950dwcupswrapper-3.0.0-1.i386.deb")
md5sums=('0f19ba503502e73fca1f96efad44f426')

prepare() {
  cd "$srcdir"
  ar x mfc8950dwcupswrapper-3.0.0-1.i386.deb
  tar xvf data.tar.gz
}

package() {
   cd "$srcdir"
   install -Dm755 "$srcdir/opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_MFC8950DW"
   install -Dm644 "$srcdir/opt/brother/Printers/MFC8950DW/cupswrapper/brother-MFC-8950DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-MFC-8950DW-cups-en.ppd"
}

# package(){
#     tar -xf data.tar.gz -C "${pkgdir}"
#     mkdir -p -m 755 "${pkgdir}"/usr/share/cups/model/Brother
#     mkdir -p -m 755 "${pkgdir}"/usr/lib/cups/filter
#     ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother-MFC-8950DW-cups-en.ppd "${pkgdir}"/usr/share/cups/model/brother-MFC-8950DW-cups-en.ppd
#     ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_mfc8950cdw
# }

post_install() {
  echo "Restarting CUPS service..."
  systemctl restart cups.service
  echo "Installation completed. Add your printer through CUPS web interface (http://localhost:631)."
}
