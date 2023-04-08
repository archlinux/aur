# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-translationstring
pkgver=1.4
pkgrel=7
pkgdesc="Utility library for i18n relied on by various Repoze and Pyramid packages"
arch=('any')
license=('BSD')
url="https://github.com/Pylons/translationstring"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/Pylons/translationstring/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f470967e04701f7d5c27acefcd3c058d0b9c600115e2e33212d6855ef0eb932d025b8af0d2017202cf6e1893ef8023edd60453de1c45e495c88846627af200db')

prepare() {
  cd translationstring-$pkgver
  # Taken from upstream release workflow:
  # https://github.com/Pylons/translationstring/blob/1.4/.github/workflows/main.yaml#L47
  sed -ie "/version/s/=.*/='$pkgver',/" setup.py
}

build() {
  cd translationstring-$pkgver
  python setup.py build
}

check() {
  cd translationstring-$pkgver
  nosetests3
}

package() {
  cd translationstring-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
