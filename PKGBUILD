# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

# https://www.linux.org.ru/news/opensource/17078848?lastmod=1674731910604#comment-17086662
pkgname=crqt-ng
provides=(coolreader crqt-ng crqt-ng-git)
conflicts=(coolreader crqt-ng-git)
pkgver=1.0.12
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Cross-platform open source e-book reader using crengine-ng.'
arch=('x86_64')
url='https://gitlab.com/coolreader-ng/crqt-ng'
license=('GPL-2')
depends=('crengine-ng' 'fribidi' 'hicolor-icon-theme' 'libunibreak' 'qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gitlab.com/coolreader-ng/${pkgname}/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('47675bf849de3d8ddf5d3c651042243119e007259fea89222e3ff31f4f57889e')

build() {
	cmake \
		-B "build" \
		-S "${pkgname}-${_pkgver}" \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
		-DUSE_QT=QT6 \
		-DCMAKE_BUILD_TYPE=Release
	make -C "build" all
}

package() {
	make -C "build" DESTDIR="$pkgdir" install
	install -D -m644 "${pkgname}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
