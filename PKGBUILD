# Maintainer: Sameer Puri <purisame@spuri.io>
pkgname=python-or-tools
pkgver=7.6
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.5' 'swig' 'python-protobuf')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('e36aa61a236436336a74b5186b9c03e4c98f916f14b5a1af0685cc7944f36d4b58dfb35a455d1f40b8fc8a6eec314890')

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
