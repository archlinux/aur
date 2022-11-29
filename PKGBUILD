# Maintainer: Renner03 <Renner03@protonmail.com>

pkgname=swaysome-git
_pkgname=swaysome
pkgver=1.1.5.r49.gd700e56
pkgrel=1
pkgdesc='AwesomeWM-like workspaces for sway'
arch=('x86_64')
url='https://gitlab.com/hyask/swaysome'
license=('MIT')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
