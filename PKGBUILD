# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1128
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="http://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
sha512sums=('6829cb8c095b2e62d95a6d47c1610f0e45f8d2e15a9a1407c972b28824594e07a87dcb7c6a93db9c5476a1b619c1a7cc6c23a290b1e2bcdbd86b60a232edb04f')

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
