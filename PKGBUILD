# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.1743
pkgrel=2
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python' 'python-dukpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pysocks: for socks proxy support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/soimort/you-get/archive/v$pkgver.tar.gz")
b2sums=('d8151c7288565fe7f73d8f581dd5ea6ab0970f2d89f0b7cfc615d469ca93efbcf8a52eb166275ff1d5c4188a8c94306f651748464eb8857df4540e99a5f99ecd')

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
