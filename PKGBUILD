# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=bash_kernel
pkgname=jupyter-${_name}
pkgver=0.9.3
pkgrel=1
pkgdesc="A Jupyter kernel for bash"
arch=('any')
url="https://github.com/takluyver/bash_kernel"
license=('BSD')
depends=('jupyter-notebook' 'bash' 'python-pexpect' 'python-flit-core' 'python-ipykernel' 'python-debugpy')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9f7a03811ca7d9cb1fbff8082237cf0450b97182252fd0b80587a16b65e66d58')
  


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
