# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

_pkgname=selenium
pkgname=python-$_pkgname
pkgver=4.1.4
pkgrel=2
pkgdesc="Python language bindings for Selenium WebDriver"
arch=('any')
url="https://www.selenium.dev"
license=('Apache')
depends=('python-urllib3' 'python-certifi' 'python-debugpy' 'python-inflection'
         'python-multidict' 'python-importlib-metadata' 'python-trio-websocket'
         'geckodriver')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/SeleniumHQ/$_pkgname/archive/refs/tags/$_pkgname-$pkgver-python.tar.gz")
sha256sums=('6bbabf82d437d3226899a9624aeeaf65ed58882110c205b4adc863ff4557812e')
options=(!makeflags)

prepare() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver-python/py"
  cp ../rb/lib/$_pkgname/webdriver/atoms/* $_pkgname/webdriver/remote
  touch $_pkgname/webdriver/firefox/webdriver_prefs.json
}

build() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver-python/py"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver-python/py"
  pytest
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver-python/py"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
