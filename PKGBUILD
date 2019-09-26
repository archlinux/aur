# Maintainer: hashworks <mail@hashworks.net>
pkgname=zimwriterfs
pkgver=1.3.7
pkgrel=3
pkgdesc="A tool for creating ZIM files based on contents on a local filesystem"
license=('GPL3')
arch=('any')
depends=('libzim>=6.0.1' 'gumbo-git' 'xapian-core')
makedepends=('meson')
url='https://github.com/openzim/zimwriterfs'
source=("https://github.com/openzim/zimwriterfs/archive/${pkgver}.tar.gz")
sha256sums=(d55e13194e29100bf88bb201c5661ab7d2600a9e45c6caeb2a21647cdbf6cb4e)

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
