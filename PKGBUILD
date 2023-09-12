# Maintainer: 

pkgname=flakyflash-git
_pkgname=flakyflash
pkgver=r21.04bee13
pkgrel=1
pkgdesc='a Linux-based tool for diagnosing and salvaging FAT- and exFAT-formatted flash media having flaky sectors that do not retain data correctly'
url='https://github.com/whitslack/flakyflash'
arch=(x86_64)
license=('custom:Unlicense')
conflicts=(flakyflash)
provides=(flakyflash)
depends=('glibc' 'gcc-libs')
optdepends=()
source=('git+https://github.com/whitslack/flakyflash.git')
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
 # git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 "out/$(gcc -dumpmachine)/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
 
  install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$_pkgname/UNLICENSE"
}
