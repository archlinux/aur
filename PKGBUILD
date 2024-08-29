# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1730
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-dukpy')
optdepends=('python-dukpy: extract videos from YouTube'
            'python-pysocks: for socks proxy support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
b2sums=('c372126c9bdce61b65909753347b6c206e3799bb793e656824256c26a55a88dd2b11c70343cd82e48f1aae882b004b9b87ccfacada7974c366516f6ace86552f')

build() {
  cd you-get-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd you-get-$pkgver
  (cd src; python -m unittest discover -s ../tests)
}

package() {
  cd you-get-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 contrib/completion/_you-get "$pkgdir"/usr/share/zsh/site-functions/_you-get
  install -Dm644 contrib/completion/you-get-completion.bash "$pkgdir"/usr/share/bash-completion/completions/you-get
  install -Dm644 contrib/completion/you-get.fish "$pkgdir"/usr/share/fish/vendor_completions.d/you-get.fish
}
