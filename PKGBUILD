# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=regextester
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple regex tester"
arch=('x86_64' 'i686')
url="https://github.com/artemanufrij/${pkgname}"
license=('GPL3')
source=("https://github.com/artemanufrij/${pkgname}/archive/${pkgver}.tar.gz")
depends=('granite' 'gtk3')
makedepends=('meson' 'ninja' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('a9785c86357288632079bad7d897af7d2216e8ed2fcf6467f9991fd7adb26d3b')

build() {
  cd "${pkgname}-${pkgver}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}