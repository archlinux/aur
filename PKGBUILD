# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='lenspect'
pkgver=1.0.5
pkgrel=1
pkgdesc='Lightweight security threat scanner intended to make malware detection more accessible and efficient'
arch=('any')
url='https://github.com/vmkspv/lenspect'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a8bbd4eaef140a1772e2e1ff0335a681b21be9c23d95ee5c206a50fec7f9aa42')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --no-rebuild --destdir "${pkgdir}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

