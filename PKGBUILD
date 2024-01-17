# Maintainer: Arthur Deierlein <arthur at deierlein dot ch>

_pkgname=vault-gui
pkgname=$_pkgname-git
pkgver=0.1.0.r3.gfce7e74
pkgrel=1
pkgdesc="GUI for Hashicorps Vault"
arch=('x86_64')
url="https://github.com/adfinis/vault-gui"
license=('MIT')
depends=('openssl' 'webkit2gtk')
makedepends=('cargo' 'git' 'pnpm')
source=("$_pkgname::git+$url")
provides=('vault-gui')
b2sums=('SKIP')

build() {
  cd "$_pkgname"
  pnpm i --frozen-lockfile
  pnpm run build:vite
  pnpm tauri build -b none
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  cd "$_pkgname"
  install -Dm 755 "src-tauri/target/release/vault-gui" "$pkgdir/usr/bin/$_pkgname"
}

# vim: ts=2 sw=2 et:
