# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='lenspect'
pkgver=1.0.6
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
sha256sums=('9b5a7f52bf9662dfd6b2f80f6d4afe65d9d39f9da2d08e8a2b12e0cfd7225e75')

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

