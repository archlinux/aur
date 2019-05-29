# Maintainer: hashworks <mail@hashworks.net>
pkgname=zimwriterfs
pkgver=1.3.3
pkgrel=1
pkgdesc="A tool for creating ZIM files based on contents on a local filesystem"
license=('GPL3')
arch=('any')
depends=('libzim>=5.0.0' 'gumbo-git' 'xapian-core')
makedepends=('meson')
url='https://github.com/openzim/zimwriterfs'
source=("https://github.com/openzim/zimwriterfs/archive/${pkgver}.tar.gz")
sha256sums=(3080085bc7bda6587330ffafb2aaa5ef611fae9105997d065e4e011b62d52a73)

build() {
	cd "${pkgname}-${pkgver}"
	# See https://github.com/openzim/zimwriterfs/issues/64
	arch-meson build -Dwerror=false
	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
