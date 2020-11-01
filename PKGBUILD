# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# upstream rolled back to v1.3.0 - pkgver hack to avoid setting epoch
_pkgver=1.3.0

pkgname='tuner'
pkgver=1.3.1
pkgrel=2
pkgdesc='Discover and play internet radio stations'
arch=('x86_64')
url='https://github.com/louis77/tuner'
license=('GPL3')
depends=('geoclue' 'granite' 'gst-plugins-bad-libs')
makedepends=('meson' 'vala')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz")
sha256sums=('37b9e69fbf6aa9da287ced34e3931663f357a9e83b0c3e4f72d036d26646a04b')

build() {
  arch-meson "${pkgname}-${_pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${_pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
