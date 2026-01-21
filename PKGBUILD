# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

pkgname=mbctl-git
pkgver=0.6
pkgver() {
    cd "$srcdir/Man8S-CTR"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

pkgrel=1
pkgdesc='Another container orchestration system. Man8S use yggdrasil as VPN networking, use containerd to maintain containers and images, and use a new kind of config manage various types of dirs of containers.'

arch=('any')
url="https://github.com/Neboer/Man8S-CTR.git"
license=('Apache-2.0')
depends=('yggdrasil' 'python' 'containerd' 'nerdctl' 'python-yaml' 'python-pydantic' 'python-typer' 'python-prettytable')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('mbctl')
provides=('mbctl')
backup=('etc/mbctl/config.yaml')

source=(
    "git+https://github.com/Neboer/Man8S-CTR.git"
)

b2sums=('SKIP')

build() {
    cd "$srcdir/Man8S-CTR"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Man8S-CTR"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
