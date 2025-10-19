# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='lenspect'
pkgver=1.0.1
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
sha256sums=('4c9c2d58c9b753a4ddb4175ce9578f30b73134aa5431248050d1414c6acfecae')

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

