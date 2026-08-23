# Maintainer: Jeffrey Carpenter <i8degrees+aur at 479831 dot xyz>
pkgname=fontbm
pkgver=0.7.1
pkgrel=1
pkgdesc="BMFont compatible command line bitmap font generator."
arch=('x86_64')
url="https://github.com/vladimirgamalyan/fontbm"
license=('MIT')
depends=('freetype2')
makedepends=('cmake')
source=("https://github.com/vladimirgamalyan/fontbm/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('099ef2f90762c47b31145307eb43042415f1e1327469793c7efd20ca5801483e67bc9befe6166db4ff171f8d46da63521e2a0f210d8290a4377d4b674b91419e')

build() {
        cd "${pkgname}-${pkgver}"
        cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
        make
}

check() {
        cd "${pkgname}-${pkgver}"
        ./unit_tests
}

package() {
        cd "${pkgname}-${pkgver}"
        install -D -m755 'fontbm' "${pkgdir}/usr/bin/fontbm"
        install -D -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
