# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
pkgname=claw
pkgver=1.2.1
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
sha256sums_x86_64=('e81ed9f784f1423ef6222b9d96ce008bd09adabb11187493f30f82aea11e7186')


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

