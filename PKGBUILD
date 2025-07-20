# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-ruamel.yaml.string
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="Adds a method dump_to_string (and its equivalent dumps) to the ruamel.yaml.YAML instance that returns the document as a Python string."
arch=('any')
url="https://sourceforge.net/p/ruamel-yaml-string"
license=('MIT')
depends=('python-ruamel-yaml')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7a7aedcc055d45c004d38b756f58474ebefb106851f4ce56ce58415709784350')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
