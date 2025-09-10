# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=juledoc
pkgname="$_pkgname-git"
pkgver=r3461147
pkgrel=1
pkgdesc='Jule code documentation generator'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/julelang/$_pkgname"
license=('BSD-3-Clause')
groups=('jule')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('glibc' 'gcc-libs')
makedepends=('julec' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  echo "r$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  mkdir -p bin
  echo "Building $_pkgname for $CARCH..."
  julec build --opt-deadcode -p --opt L2 -o "bin/$_pkgname" ./src
}

check() {
  cd "$_pkgname"
  echo "Building tests for $_pkgname..."
  julec test ./src -o "bin/$_pkgname-test"
  "bin/$_pkgname-test"
}

package() {
  cd "$_pkgname"
  install -Dm755 "bin/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
