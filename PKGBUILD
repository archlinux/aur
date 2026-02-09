# Maintainer: Nikolay Nerovny <nerovny@mailbox.org>
pkgname=vatomic
pkgver=2.4.1
pkgrel=1
pkgdesc="VSync atomics - formally-verified atomic operations library"
arch=('any')
url="https://github.com/open-s4c/vatomic"
license=('MIT')
groups=('base-devel')
depends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3af8913059bf52c9d269e4a9cb11b81a82c02ea6547946a11b8fb8f3a5c9d10e')
build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        cmake -S . -B build
        cmake --build build -j
}
check() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        ctest --test-dir build --output-on-failure -E "ut_int_types|ut_ptr"
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        cmake --install build --prefix "${pkgdir}/usr"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
