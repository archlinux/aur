# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

pkgname=mbctl-git
pkgver=0.2.1
pkgver() {
    cd "$srcdir/Man8S-oci"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

pkgrel=2
pkgdesc='一种基于systemd-nspawn实现的、支持网络隔离和现代网络栈的容器运行时方案，兼容OCI与Docker。'

arch=('any')
url="https://github.com/Neboer/Man8S-oci.git"
license=('Apache-2.0')
depends=('yggdrasil' 'skopeo' 'umoci' 'busybox' 'python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('mbctl')
provides=('mbctl')
backup=('etc/mbctl.json')

source=(
    "git+https://github.com/Neboer/Man8S-oci.git"
)

b2sums=('SKIP')

build() {
    cd "$srcdir/Man8S-oci"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Man8S-oci"
    python -m installer --destdir="$pkgdir" dist/*.whl
}