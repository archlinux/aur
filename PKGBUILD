# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1700
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pysocks: for socks proxy support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
b2sums=('0c732a123bd04db71f1ec9ecf380e4dda27f2ac70745a10616ddf9b955a236adffea609ffe0cab0c70030b64f965151024eb624062aededa4ea851afbd6f49f1')

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
