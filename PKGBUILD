# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=geckodriver-hg
pkgver=r552364.1581160e62e6
pkgrel=2
pkgdesc="WebDriver for Firefox"
arch=('i686' 'x86_64')
url="https://github.com/mozilla/geckodriver"
license=('MPL')
depends=('gcc-libs')
makedepends=('mercurial' 'rust')
provides=("geckodriver=$pkgver")
conflicts=('geckodriver')
source=("hg+https://hg.mozilla.org/mozilla-central/")
sha256sums=('SKIP')


prepare() {
  cd "mozilla-central/testing/geckodriver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "mozilla-central/testing/geckodriver"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

check() {
  cd "mozilla-central/testing/geckodriver"

  #cargo test \
  #  --frozen
}

package() {
  cd "mozilla-central/testing/geckodriver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/mozilla-central/testing/geckodriver"
}
