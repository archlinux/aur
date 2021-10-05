# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-spyse
_name="${pkgname#python-}"

pkgver=2.2.3
pkgrel=1

pkgdesc='Python wrapper for spyse.com API'
arch=('any')
url="https://github.com/$_name-com/$_name-python"
license=('MIT')

makedepends=('python-setuptools')
checkdepends=('python-pytest')
depends=('python' 'python-requests' 'python-dataclasses' 'python-dataclasses-json'
         'python-responses' 'python-limiter')

source=("$_name-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfceb8b2bd94a18f99f212bf6e8be6971687af5e9f8d8c57d36491022e1623f0')


build() {
  cd "$_name-python-$pkgver"
  PYTHONHASHSEED=0 python setup.py build
}

#check() {
#  cd "$_name-python-$pkgver"
#  # to perform the tests, include your API token here :
#  SPYSE_API_TOKEN= pytest
#}

package() {
  cd "$_name-python-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE.md -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
