# Maintainer: Jason Nader <jason.nader@protonmail.com>

pkgname=dbus-codegen-rust-git
_pkgname=dbus-codegen-rust
pkgver=0.9.0.r901.g6b0600a
pkgrel=1
pkgdesc='This program takes D-Bus XML Introspection data and generates Rust code for calling and implementing the interfaces in the introspection data.'
arch=('x86_64')
url='https://github.com/diwic/dbus-rs'
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname/dbus-codegen"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "$_pkgname/dbus-codegen"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
