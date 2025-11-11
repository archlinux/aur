# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='lenspect'
pkgver=1.0.2
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
sha256sums=('99e83e7b3c1eb69ba19e9f0a0076dbee8b5bb2ba7ec2d88455fa600d0e80b8a1')

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

