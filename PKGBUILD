# Maintainer: hashworks <mail@hashworks.net>
pkgname=zimwriterfs
pkgver=1.3.5
pkgrel=1
pkgdesc="A tool for creating ZIM files based on contents on a local filesystem"
license=('GPL3')
arch=('any')
depends=('libzim>=5.0.1' 'gumbo-git' 'xapian-core')
makedepends=('meson')
url='https://github.com/openzim/zimwriterfs'
source=("https://github.com/openzim/zimwriterfs/archive/${pkgver}.tar.gz")
sha256sums=(bb727d21fe889f9067d3e39cae0b103c657d5eafe4772b194b5ddbbe431eb89c)

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
