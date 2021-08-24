# Maintainer: LeSnake04 <dev.lesnake@posteo.de>

_pkgname=cryptocam-companion-cli
pkgname="$_pkgname-git"
_pkgver=0.1.0
pkgver=0.1.0.f149dcb
pkgrel=1
arch=('x86_64')
pkgdesc="Companion for Cryptocam, the encrypted android camera app – CLI version"
url="https://gitlab.com/cryptocam/cryptocam-companion-cli"
license=('GPL3')
depends=('ffmpeg')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'rust' 'cargo' 'gcc' 'clang')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$_pkgver" "$(git rev-parse --short HEAD)"
}

build() {
   _repodir=$srcdir/$pkgname
   cd $_repodir
   cargo build --release
}

package() {
   _repodir=$srcdir/$pkgname
   _binsrc=$_repodir/target/release/cryptocam
   _bintarget=$pkgdir/usr/bin/$_pkgname
   install -Dm755 $_binsrc $_bintarget
}
