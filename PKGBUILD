# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-openvino-telemetry-git
pkgver=r69.gf3e6d01
pkgrel=1
pkgdesc='Pythno library for sending statistics data from the OpenVINO toolkit components (git version)'
arch=('any')
url='https://github.com/openvinotoolkit/telemetry/'
license=('Apache-2.0')
depends=(
    'python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
provides=('openvino-telemetry')
conflicts=('openvino-telemetry')
source=('openvino-telemetry'::'git+https://github.com/openvinotoolkit/telemetry.git')
sha256sums=('SKIP')

pkgver() {
    cd openvino-telemetry
    ( set -o pipefail
        git describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short='7' HEAD)"
    )
}

build() {
    cd openvino-telemetry
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" openvino-telemetry/dist/*.whl
}
