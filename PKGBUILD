# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=3.8.2
pkgrel=2
pkgname=python-yamlpath
_name=${pkgname#python-}
pkgdesc='Command-line get/set/merge/validate/scan/convert/diff processors for YAML/JSON/Compatible data using powerful, intuitive, command-line friendly syntax.'
arch=('any')
url='https://github.com/wwkimball/yamlpath/wiki'
license=('ISC')
depends=('python-ruamel-yaml<=0.17.21' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('653996d1c16b7d35e1ad392f83422545848af0431e2d7aec3d935982daa1290596fb6506120091af06bdc42f0660804d215fd079ce2e24b18785e3ba0e628d39')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
