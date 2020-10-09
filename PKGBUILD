# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=geckodriver-hg
pkgver=r552364.1581160e62e6
pkgrel=1
pkgdesc="WebDriver for Firefox"
arch=('i686' 'x86_64')
url="https://github.com/mozilla/geckodriver"
license=('MPL')
depends=('gcc-libs')
makedepends=('mercurial' 'rust')
provides=('geckodriver')
conflicts=('geckodriver')
source=("hg+https://hg.mozilla.org/mozilla-central/")
sha256sums=('SKIP')


pkgver() {
  cd "mozilla-central/testing/geckodriver"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

check() {
  cd "mozilla-central/testing/geckodriver"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "mozilla-central/testing/geckodriver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/mozilla-central/testing/geckodriver"
}
