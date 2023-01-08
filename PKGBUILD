# Maintainer: Filipe Cruz <filipecruz@tuta.io>
_pkgname=playlist-maker
_binname=pl-mker
_pkgver=0.4.0
pkgname=playlist-maker-rs
pkgver=0.4.0.r10.363a44d
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('cargo')
source=("$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('05527060f6243e8ad2da128656426106c6ad29a80cd6764a6585eb5779de30e7')

pkgver() {
  cd "$_pkgname-$_pkgver"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname-$_pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$_pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_binname"
  install -Dm644 "$srcdir/$_pkgname-$_pkgver/autocompletions/pl-mker.bash" "$pkgdir/etc/bash_completion.d/pl-mker"
  install -Dm644 "$srcdir/$_pkgname-$_pkgver/autocompletions/_pl-mker" "$pkgdir/usr/share/zsh/site-functions/_pl-mker"
  install -Dm644 "$srcdir/$_pkgname-$_pkgver/autocompletions/pl-mker.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pl-mker.fish"
}
