# Maintainer: Sameer Puri <purisame@spuri.io>
pkgname=python-or-tools
pkgver=7.8
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.5' 'swig' 'python-protobuf')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('73f051808575bffdcd4a9bb07a45a8d2ba2dc9dc565771b6fb1706f3271f74f271236470b25c08da6ad467764fe9599f')

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
