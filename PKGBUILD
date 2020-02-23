# Maintainer: Jason Nader <jason.nader@protonmail.com>

pkgname=workstyle-git
_pkgname=workstyle
pkgver=0.2.1.r29.g43b0b5b
pkgrel=1
pkgdesc='Dynamically renames sway/i3 workspaces to indicate which programs are running in each one'
arch=('x86_64')
url='https://github.com/pierrechevalier83/workstyle'
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
