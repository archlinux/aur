# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=geckodriver-hg
pkgver=r470330.b783cd5203ea
pkgrel=1
pkgdesc="WebDriver for Firefox"
arch=('i686' 'x86_64')
url="https://github.com/mozilla/geckodriver"
license=('MPL')
depends=('gcc-libs')
makedepends=('mercurial' 'cargo')
provides=('geckodriver')
conflicts=('geckodriver')
source=("hg+https://hg.mozilla.org/mozilla-central/")
sha256sums=('SKIP')


pkgver() {
  cd "mozilla-central/testing/geckodriver"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "mozilla-central/testing/geckodriver"

  cargo build --release
}

check() {
  cd "mozilla-central/testing/geckodriver"

  cargo test --release
}

package() {
  cd "mozilla-central/target/release"

  install -Dm755 "geckodriver" "$pkgdir/usr/bin/geckodriver"
}
