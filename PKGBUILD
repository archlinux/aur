# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgname=rusnapshot-git
_pkgname=rusnapshot
pkgver=68.97fa393
pkgrel=1
pkgdesc='Simple and handy definitions-based snapshoting tool for BTRFS (git version)'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Edu4rdSHL/rusnapshot'
license=('MIT')
depends=('sqlite' 'btrfs-progs')
makedepends=('cargo' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/Edu4rdSHL/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_pkgname"

  cargo build --release --locked
}

check() {
  cd "$_pkgname"

  cargo test --release --locked
}

package() {
  cd "$_pkgname"

  install -dm 755 "${pkgdir}/etc/$_pkgname"

  install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cp -R examples/* -t "$pkgdir/usr/share/doc/$pkgname"
}

