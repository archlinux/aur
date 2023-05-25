# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=bash_kernel
pkgname=jupyter-${_name}
pkgver=0.9.0
pkgrel=1
pkgdesc="A Jupyter kernel for bash"
arch=('any')
url="https://github.com/takluyver/bash_kernel"
license=('BSD')
depends=('jupyter-notebook' 'bash' 'python-pexpect')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0423f0512ef6f83a654e1439a369718899a38f27948fe21b665b2df1dbf3a7c7')
  


build() {
  cd "$srcdir"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m bash_kernel.install --prefix="$pkgdir"/usr
}
