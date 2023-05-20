# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=jefferson
pkgname=python-${_pyname}
pkgver=0.4.3
pkgrel=1
pkgdesc='JFFS2 filesystem extraction tool.'
arch=('x86_64')
url="https://github.com/onekey-sec/$_pyname"
license=(MIT)
depends=(python)
conflicts=()
provides=(python-jefferson)
makedepends=(git python-poetry python-pip python-build python-installer python-wheel python-setuptools python-click python-cstruct python-lzallright)
checkdepends=(python-pytest python-pytest-cov)
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('01ba63de040ae28be8f28cd9136c02c9f4660df7e84b028c6c78e08fb1675ff8')


build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
 
# tests folder absent from upstream repo
#check()  {
#  cd "$_pyname-$pkgver"
#  local tmp=$(mktemp -d)
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  ls -lah *
#  python -m installer --destdir="$tmp" dist/$_pyname-$pkgver-py3-none-any.whl
#  PYTHONPATH="$tmp$site_packages" python -m pytest tests
#
#  rmdir --ignore-fail-on-non-empty $tmp 
#}

