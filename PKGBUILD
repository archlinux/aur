# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: jmcb <joelsgp@protonmail.com>
pkgname=python-passwdgen
_name=passwdgen
pkgver=0.4.0
pkgrel=3
pkgdesc=" A simple password generation utility"
arch=('any')
url="https://github.com/thanethomson/passwdgen"
license=('MIT')
depends=('python' 'python-pyperclip')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('081437e2f2958a0df934ec6de37c383f0c465675709f4e650f46c89c08484c94')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m unittest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
