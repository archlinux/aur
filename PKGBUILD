# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-comparxiv
_name=${pkgname#python-}
# No tag for latest version available in PyPI
_commit=e2b482eb0fcf171822a1d06063591bbe1c7776c1
pkgver=0.1.9
pkgrel=5
pkgdesc="A wrapper of latexdiff to compare two version of an arXiv preprint with a single command"
arch=(any)
url=https://github.com/temken/comparxiv
license=(MIT)
depends=(
    python-arxiv
    python-requests
    python-tqdm
    texlive-bin
    texlive-core
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_name::git+https://github.com/temken/comparxiv#commit=$_commit)
b2sums=('85fce3c6d60b11010bc9a3bc9bbe270414616aed929a0e7e320625a29fe5750d275db099c49da80623d7ab00509dfa208dc3d81c602024df81c13f4366f4213a')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
