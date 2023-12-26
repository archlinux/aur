# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=3.8.1
pkgrel=1
pkgname=python-yamlpath
_name=${pkgname#python-}
pkgdesc='Command-line get/set/merge/validate/scan/convert/diff processors for YAML/JSON/Compatible data using powerful, intuitive, command-line friendly syntax.'
arch=('any')
url='https://github.com/wwkimball/yamlpath/wiki'
license=('ISC')
depends=('python-ruyaml' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('8df74b1419670339c64252fc7ced277858acea9c2162f79d1da6b37af386f1a6debe302514d72b52bb373abed44d91e3a6ea15e8e6228ec14acd4afca348769a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
