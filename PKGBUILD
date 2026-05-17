pkgname=python312-virtualenv
pkgver=21.3.1
pkgrel=1
pkgdesc='Virtual Python environment builder for Python 3.12'
arch=('any')
url='https://github.com/pypa/virtualenv'
license=('MIT')
depends=(
  'python312'
  'python312-distlib'
  'python312-filelock'
  'python312-platformdirs'
  'python312-python-discovery'
  'python312-packaging'
)
makedepends=('python312-installer')
source=("virtualenv-21.3.1-py3-none-any.whl::https://files.pythonhosted.org/packages/b1/4f/f71e641e504111a5a74e3a20bc52d01bd86788b22699dd3fee1c63253cf6/virtualenv-21.3.1-py3-none-any.whl")
sha256sums=('d1a71cf58f2f9228fff23a1f6ec15d39785c6b32e03658d104974247145edd35')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/virtualenv-21.3.1-py3-none-any.whl"

  # Avoid conflicting with Arch's python-virtualenv package, which owns /usr/bin/virtualenv.
  rm -f "$pkgdir/usr/bin/virtualenv"
  rmdir --ignore-fail-on-non-empty "$pkgdir/usr/bin"
}
