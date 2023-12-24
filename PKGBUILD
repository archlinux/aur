# Maintainer: Alexander Rundberg <alexanderrundberg [at] fastmail [dot] jp>
# Maintainer: Ryan O'Beirne <ryanobeirne [at] ryanobeirne [dot] com>
__pkgname=pretty-git-prompt
pkgname="$__pkgname-git"
conflicts=("$__pkgname")
pkgver=0.2.1_63967bc
pkgrel=1
pkgdesc="Pretty git status for your shell prompt"
arch=('any')
url="https://github.com/TomasTomecek/pretty-git-prompt"
license=('MIT')
depends=('git')
makedepends=('rust' 'cmake')
source=("git+https://github.com/TomasTomecek/pretty-git-prompt.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$__pkgname"
	local cargo_version="$(sed -En '/version/s/^.*=.*"(.*)".*$/\1/p' Cargo.toml | head -n1)"
	local git_hash="$(git rev-parse --short HEAD)"
	printf '%s_%s' "$cargo_version" "$git_hash"
}

build() {
  cd "$srcdir/$__pkgname"
  make exec-stable-build
}

package() {
  cd "$srcdir/$__pkgname"
  install -Dm755 "target/release/pretty-git-prompt" "$pkgdir/usr/bin/pretty-git-prompt"
}
