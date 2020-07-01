# Maintainer: hashworks <mail@hashworks.net>
pkgname=zimwriterfs
pkgver=1.3.10
pkgrel=5
pkgdesc="A tool for creating ZIM files based on contents on a local filesystem"
license=('GPL3')
arch=('x86_64')
depends=('libzim>=6.0.1' 'gumbo-git' 'xapian-core')
makedepends=('meson')
url='https://github.com/openzim/zimwriterfs'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(5eb9eed011d977d4c0d9530cde347819c49913073a37e29786a65640b27fd96c)

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package() {
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
