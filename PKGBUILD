# Maintainer: bouhaa <boukehaarsma23 at gmail dot com>

_pkgname="zenergy"
pkgname="$_pkgname-dkms-git"
pkgver=32.58f2fda
pkgrel=1
pkgdesc="Linux kernel driver for reading RAPL registers for AMD Zen CPUs"
url="https://github.com/boukehaarsma23/zenergy"
license=('GPL-2.0-only')
arch=('x86_64')

depends=('dkms')
makedepends=('git')

provides=('zenergy-dkms')
conflicts=('zenergy-dkms')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # pkgver is updated after prepare
  sed -e "/CLEAN/d" -e "s/@VERSION@/$pkgver/" -i "$_pkgsrc/dkms.conf"

  install -Dm644 "$_pkgsrc"/{dkms.conf,Makefile,zenergy.c} -t "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
