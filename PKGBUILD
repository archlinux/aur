# Maintainer: Alexander Rundberg <alexanderrundberg [at] fastmail [dot] jp>
# Maintainer: Ryan O'Beirne <ryanobeirne [at] ryanobeirne [dot] com>
__pkgname=pretty-git-prompt
pkgname="$__pkgname-git"
conflicts=("$__pkgname")
pkgver=0.2.2_6b1509a
pkgrel=1
pkgdesc="Pretty git status for your shell prompt"
arch=('any')
url="https://github.com/TomasTomecek/pretty-git-prompt"
license=('MIT')
depends=('git')
makedepends=('rust' 'cmake')
source=("$pkgname::git+https://github.com/TomasTomecek/pretty-git-prompt.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"
	local cargo_version="$(sed -En '/version/s/^.*=.*"(.*)".*$/\1/p' Cargo.toml | head -n1)"
	local git_hash="$(git rev-parse --short HEAD)"
	printf '%s_%s' "$cargo_version" "$git_hash"
}

build() {
  cd "$srcdir/$pkgname"
  make exec-stable-build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/pretty-git-prompt" "$pkgdir/usr/bin/pretty-git-prompt"
}
