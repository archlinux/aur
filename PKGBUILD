# Maintainer: hashworks <mail@hashworks.net>
pkgname=zim-tools
pkgver=2.0.0
pkgrel=2
pkgdesc="Various ZIM command line tools"
license=('GPL3')
arch=('x86_64')
provides=('zimwriterfs')
conflicts=('zimwriterfs')
replaces=('zimwriterfs')
depends=('libzim' 'docopt' 'gumbo')
makedepends=('meson')
url='https://github.com/openzim/zim-tools'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(21584fbbef7dd8594a92e9baeebef8c263a189ec4aef46ef5b94eea31bbabace)

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
