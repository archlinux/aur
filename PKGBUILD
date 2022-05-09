# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1602
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pysocks: for socks proxy support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
sha512sums=('8ca41e0d5499d8150bf782e7fd93ab7baf86ba40599ca120e9afa51b8f2696526cdab9f5b29b7c173fd9830c9cfbf8463d8840ad13cbaa4b34729e1809415760')

build() {
  cd you-get-$pkgver
  python setup.py build
}

check() {
  cd you-get-$pkgver
  python setup.py test || echo "Tests failed"
}

package() {
  cd you-get-$pkgver
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 contrib/completion/_you-get "$pkgdir"/usr/share/zsh/site-functions/_you-get
  install -Dm644 contrib/completion/you-get-completion.bash "$pkgdir"/usr/share/bash-completion/completions/you-get
  install -Dm644 contrib/completion/you-get.fish "$pkgdir"/usr/share/fish/vendor_completions.d/you-get.fish
}
