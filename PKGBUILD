# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=openxrechnungtoolbox
_pkgname=OpenXRechnungToolbox
_pkgdate=2024-10-05
pkgver=3.0.0
pkgrel=1
pkgdesc="Visualization and validation of XRechnung (and other EN16931 compliant e-invoices)"
arch=('x86_64')
url="https://jcthiele.github.io/OpenXRechnungToolbox/"
license=('GPL3')
depends=('desktop-file-utils' 'xdg-user-dirs' 'java-runtime>=8')
options=('!strip')
source=("https://github.com/jcthiele/${_pkgname}/releases/download/${_pkgdate}-${pkgver}/${_pkgname}_${pkgver}_Linux_64bit.zip"
        "${pkgname}.desktop")
sha256sums=('33859aa170e7743a2437721835f2cfee97bffd104bf6c0b611220a2e0a9af59b'
            'ece0dc3c3984e71953a8d8cd8b334c374bf621dab8a262c61ae47a29c9d66440')

package() {
  cd "$srcdir"

  # Prepare directories
  install -d "$pkgdir"/opt/$pkgname/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/$pkgname/

  # Create and install the launcher
  echo "#!/bin/sh" >$pkgname
  echo "cd /opt/$pkgname" >>$pkgname
  cat ${_pkgname}.sh >>$pkgname
  chmod 755 $pkgname
  mv $pkgname "$pkgdir"/usr/bin/

  # Install the license
  install -t "$pkgdir"/usr/share/licenses/$pkgname license.txt

  # Install the app to /opt
  cp -a * "$pkgdir"/opt/$pkgname/
  rm "$pkgdir"/opt/$pkgname/*.zip

  # Install the menu entry
  install -t $pkgdir/usr/share/applications ${pkgname}.desktop
}
