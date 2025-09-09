# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pyknos
_name=${pkgname#python-}
pkgver=0.16.0
pkgrel=1
pkgdesc="conditional density estimation"
arch=(any)
url="https://github.com/mackelab/pyknos"
license=(AGPL3)
groups=()
depends=(python-matplotlib python-numpy tensorboard python-pytorch python-tqdm python-nflows)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4e1db834d8a5fd847882a081937732fea6798668b72293ae052765e7bfc371c3')

build() {
    cd "$srcdir/$_name-$pkgver"
    # Fix broken multiline classifier in pyproject.toml
    sed -i '/"""License/,/(AGPLv3+)"""/c\    "License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)",' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

