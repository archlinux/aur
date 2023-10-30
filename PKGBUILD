# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinyget-git
_name=${pkgname%-git}
pkgver=r30.1e9c391
pkgrel=1
epoch=
pkgdesc="A cross-distro package management tool."
arch=('any')
# url="https://pypi.org/project/tinyget"
url="https://gitee.com/tinylab/tinyget"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
    python-trogon)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools
    python-requests
    python-click
    python-orjson
    python-rich)
checkdepends=(python-pytest)
options=('!strip')
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=(${_name}::git+$url.git)
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}/"
#     git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
