# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1718
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pysocks: for socks proxy support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
b2sums=('d8a39a6e3a1e790f2667437fd7b0ba8b3bdde15ed0a436f11703cdbc71b1bf700653a6d49282dd7b7e69b290d517b4dd4d48e949e59ecf71a6300cb50d9acf57')

build() {
  cd you-get-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd you-get-$pkgver
  (cd src; python -m unittest discover -s ../tests) || echo "Tests failed"
}

package() {
  cd you-get-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 contrib/completion/_you-get "$pkgdir"/usr/share/zsh/site-functions/_you-get
  install -Dm644 contrib/completion/you-get-completion.bash "$pkgdir"/usr/share/bash-completion/completions/you-get
  install -Dm644 contrib/completion/you-get.fish "$pkgdir"/usr/share/fish/vendor_completions.d/you-get.fish
}
