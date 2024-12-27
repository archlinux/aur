# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-magnet2torrent
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=2
epoch=
pkgdesc="Turn a bittorrent magnet links into a .torrent file."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-aiohttp
    python-yarl
    #AUR
    python-expiringdict
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('4ba53d304f1db33d33fe227aee5b34f6e640fd2d3199ff0ec3d8cc050cded631')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
