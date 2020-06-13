# Maintainer: Sameer Puri <purisame@spuri.io>
pkgname=python-or-tools
pkgver=7.7
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.5' 'swig' 'python-protobuf')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('f5fe238187bf54de2f5c24ff61530399b2c346785aff0a49bf55f99aeb7b7d57b92d3a80ea98f8dc92bb61af71fd7af1')

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
