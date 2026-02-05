# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rabbitizer
pkgver=1.14.3
pkgrel=1
pkgdesc='MIPS instruction decoder API'
arch=(x86_64)
url='https://github.com/Decompollaborate/rabbitizer'
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('4492930038ced09336245775211ddf3382b2bf07ff7148c5936bb799174aba53306571dd8fbfbfb75b378e825a9f7e13dc0dfcd4dd53e7218378643168c1bf68')
b2sums=('7383bfcd0a25e777f7c95ef6d6db6f7f4590e3db03e137795075c2e8ccf9b5b17e41094b148265615eda3474a24ad2afd757bf0fc5989a6247be0ec0813db583')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
