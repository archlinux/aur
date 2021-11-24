# Maintainer: Pierre Viseu Chevalier <pierrechevalier83@gmail.com>

pkgname=find-unicode-git
_pkgname=fu
pkgver=0.4.0.r34.gb3b9d72
pkgrel=1
pkgdesc='Find unicode characters from the comfort of your shell'
arch=('x86_64')
url='https://github.com/pierrechevalier83/find_unicode'
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

