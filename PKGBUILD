# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1210
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="http://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
sha512sums=('01eb91eb9e1756f9b20678e5868c4787041c4a0b1125b4fb7c5981f1bb847ff9dbdb037309bacbfa55753a7c03da517a98e9ecd28205723f0ec43723bbcb15f7')

build() {
  cd you-get-$pkgver
  python setup.py build
}

check() {
  cd you-get-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py test
}

package() {
  cd you-get-$pkgver
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 contrib/completion/_you-get "$pkgdir"/usr/share/zsh/site-functions/_you-get
  install -Dm644 contrib/completion/you-get-completion.bash "$pkgdir"/usr/share/bash-completion/completions/you-get
  install -Dm644 contrib/completion/you-get.fish "$pkgdir"/usr/share/fish/completions/you-get.fish
}
