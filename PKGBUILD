# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

_pkgname=selenium
pkgname=python-$_pkgname
pkgver=4.1.0
pkgrel=1
pkgdesc="Python language bindings for Selenium WebDriver"
arch=('any')
url="https://www.selenium.dev"
license=('Apache')
depends=('python-urllib3' 'python-certifi' 'python-debugpy' 'python-inflection'
         'python-iniconfig' 'python-multidict' 'python-pluggy' 'python-zipp'
         'python-trio-websocket' 'geckodriver')
makedepends=('python-setuptools')
source=("https://github.com/SeleniumHQ/$_pkgname/archive/refs/tags/$_pkgname-$pkgver.tar.gz")
sha256sums=('6f8cdf423b404bb47c44bf2994ce6edc6683ba33904774ea60731eae2542d8cd')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver/py"
  cp ../rb/lib/selenium/webdriver/atoms/* selenium/webdriver/remote
  touch selenium/webdriver/firefox/webdriver_prefs.json
}

build() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver/py"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver/py"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
