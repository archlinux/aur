# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1410
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
sha512sums=('1d83b5007f9a8bddd2aef6ad4abc39428519e2423360258b8d5c757f9db70280a503408b901d8005b72fe17ac18656547c4dd87041d0027e064c3ca3f4d7428f')

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
  install -Dm644 contrib/completion/you-get.fish "$pkgdir"/usr/share/fish/vendor_completions.d/you-get.fish
}
