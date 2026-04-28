# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-lhotse
_pyname=lhotse
pkgver=1.33.0
pkgrel=1
pkgdesc='Tools for handling speech data in machine-learning projects (NVIDIA / Lhotse Speech)'
arch=('any')
url='https://github.com/lhotse-speech/lhotse'
license=('Apache-2.0')
depends=(
    'python>=3.8'
    'python-audioread'
    'python-soundfile'
    'python-click'
    'python-cytoolz'
    'python-intervaltree'
    'python-numpy'
    'python-packaging'
    'python-yaml'
    'python-tabulate'
    'python-pytorch'
    'python-tqdm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('3e91fca8531fc4c1798d0a6de1b3c7ea6bf2e181df70e5985927a131761c67f5')

build() {
    cd "$_pyname-$pkgver"
    # Without this env var lhotse's setup.py tags the version
    # "1.33.0.dev.unknownsource" because we have no .git, which fails
    # PEP 440 normalisation in modern setuptools.
    LHOTSE_PREPARING_RELEASE=1 python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
