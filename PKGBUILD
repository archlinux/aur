# Maintainer: lefrade <lefrade@protonmail.com>

_pkgname=kadimus
pkgname="$_pkgname-git"
pkgver=1.5.r7.gac5f438
pkgrel=1
pkgdesc='A tool to check and exploit lfi vulnerability'
arch=('i686' 'x86_64')
url='https://github.com/P0cL4bs/kadimus'
license=('MIT')
depends=('curl' 'pcre' 'libssh')
makedepends=('git')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+https://github.com/P0cL4bs/kadimus.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i "s/\.\/resource/\/usr\/share\/$pkgname/g" src/scan/scan.c
}

build() {
  cd "$_pkgname"
	make
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 'license.txt' "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 'resource/common_files.txt' "$pkgdir/usr/share/$pkgname/common_files.txt"
  install -Dm644 'resource/errors.txt' "$pkgdir/usr/share/$pkgname/errors.txt"
}
