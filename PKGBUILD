# Maintainer: Filipe Cruz <filipecruz@tuta.io>
_pkgname=playlist-maker
_binname=pl-mker
_pkgver=latest
pkgname=playlist-maker-rs-git
pkgver=latest
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust: git version'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('git' 'cargo')
conflicts=('playlist-maker-rs')
provides=('playlist-maker-rs')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_binname"
  install -Dm644 "$srcdir/$_pkgname/autocompletions/pl-mker.bash" "$pkgdir/etc/bash_completion.d/pl-mker"
  install -Dm644 "$srcdir/$_pkgname/autocompletions/_pl-mker" "$pkgdir/usr/share/zsh/site-functions/_pl-mker"
  install -Dm644 "$srcdir/$_pkgname/autocompletions/pl-mker.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pl-mker.fish"
}
