# Maintainer: Marek Temnyak <temnyak.marek at gmail dot com>

pkgname=svnsearch
pkgver=0.8.0
pkgrel=1
pkgdesc='Tool for searching through SVN log diffs'
arch=('x86_64')
url='https://github.com/temnyak/svnsearch'
license=('MIT')

depends=('glibc' 'apr' 'subversion' 'pcre2')
makedepends=('cmake')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88762a608e702a687af95a2f85d33b1cc8abe2340ff62026d43704f75a14ccbe')

build() {
	cmake -S "${srcdir}/${pkgname}-${pkgver}" \
	      -B "${srcdir}/build" \
	      -Wno-dev \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr

	cmake --build "${srcdir}/build"
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

	install -Dm0644 \
		"${srcdir}/${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
