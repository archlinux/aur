# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-or-tools
pkgver=7.3
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.5' 'python<3.8' 'swig' 'python-protobuf')
makedepends=('cmake' 'wget' 'lsb-release')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('a95161da7144d60d31bc222a288acb666460233a23535dc9f3196d78df0934233664d79fda0555ccd7a9bb83b19bf80f')

build() {
    cd "${srcdir}/or-tools-${pkgver}"
    make third_party
    make python
    make pypi_archive
}

package() {
    cd "${srcdir}/or-tools-${pkgver}"
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(find -name 'ortools*whl')"
}
