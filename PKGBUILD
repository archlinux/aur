# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=color-filters-reconstruction-git
pkgver=r53.a01b174
pkgrel=1
pkgdesc='Very accurate color filters reconstruction tools based on 3D color LUTs'
arch=(any)
url='https://github.com/homm/color-filters-reconstruction'
license=(MIT)
depends=(python-numpy
    'python-pillow>=4.0'
    python-scipy)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/homm/color-filters-reconstruction.git")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 bin/convert.py "${pkgdir}/usr/bin/color-filters-reconstruction-convert"
    install -Dm755 bin/generate.py "${pkgdir}/usr/bin/color-filters-reconstruction-generate"
}
