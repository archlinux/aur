# Maintainer: hashworks <mail@hashworks.net>
pkgname=zimwriterfs
pkgver=1.3.8
pkgrel=1
pkgdesc="A tool for creating ZIM files based on contents on a local filesystem"
license=('GPL3')
arch=('any')
depends=('libzim>=6.0.1' 'gumbo-git' 'xapian-core')
makedepends=('meson')
url='https://github.com/openzim/zimwriterfs'
source=("https://github.com/openzim/zimwriterfs/archive/${pkgver}.tar.gz")
sha256sums=(8074fe6cb5906764efc21e1341d2c825ce0bf55c97a9c5de3931ee565280e256)

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
