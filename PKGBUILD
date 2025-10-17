# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
pkgname=claw
pkgver=1.1.0
pkgrel=2
pkgdesc="Crustacean powered clipboard manager for X11 & Wayland"
arch=('x86_64')
url="https://github.com/saltnpepper97/claw"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=(
    'xclip: X11 clipboard support'
    'wl-clipboard: Wayland clipboard support'
)
options=('!strip' '!debug' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/claw_${pkgver}_amd64.deb")
sha256sums_x86_64=('ab3689ef65e37697ca24f2a42b2f25aae8b8ac18d2c46f6d0760581e1f7a57c8')


package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  
  if [ -d "${pkgdir}/usr/lib/${pkgname}/_up_/examples" ]; then
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a "${pkgdir}/usr/lib/${pkgname}/_up_/examples/." "${pkgdir}/usr/share/doc/${pkgname}/"
  fi

  if [ -f "${pkgdir}/usr/lib/${pkgname}/_up_/LICENSE" ]; then
    install -Dm644 "${pkgdir}/usr/lib/${pkgname}/_up_/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  rm -rf "${pkgdir}/usr/lib/${pkgname}/_up_"
}

