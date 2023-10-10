# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=3.8.0
pkgrel=2
pkgname=python-yamlpath
_name=${pkgname#python-}
pkgdesc='Command-line get/set/merge/validate/scan/convert/diff processors for YAML/JSON/Compatible data using powerful, intuitive, command-line friendly syntax.'
arch=('any')
url='https://github.com/wwkimball/yamlpath/wiki'
license=('ISC')
depends=('python-ruyaml' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('ab4f9c370a344d88f2089e3fd1ffd1307e77ed071ee30537b215c79d57aa1779e42bc55429c8cf7d77ed16b4c2a35b17c302724bf9970d00d16ec18e32ae4535')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
