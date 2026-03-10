# Maintainer: tlipinski <aur at t3xh dot nl>

pkgname=lssub-git
_pkgname=${pkgname%-*}
pkgver=r267.cefb18a
pkgrel=1
pkgdesc="Terminal UI app for searching and downloading subtitles via the OpenSubtitles API"
arch=('x86_64')
url="https://github.com/tlipinski/lssub"
license=('MIT')
depends=('libsecret')
makedepends=('cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
