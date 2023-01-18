# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
_pkgname=line_profiler
pkgver=4.0.2
pkgrel=1
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('x86_64')
license=('BSD')
depends=('python-setuptools' 'ipython')
makedepends=('cython3' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-ubelt')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pyutils/line_profiler/archive/v$pkgver.tar.gz")

sha256sums=('4b10543d250ad900c2ab38d90d5e51aa7e645cd1e94842cda76706e486ba02b7')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation 
}

#check() {
  #local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  #cd "$_pkgname-${pkgver}"
  #python -m installer --destdir=test_dir dist/*.whl
  #export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  #export PATH="${srcdir}/$_pkgname-${pkgver}/test_dir/usr/bin:$PATH"
  #pytest tests
#}

package() {
  cd "line_profiler-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
