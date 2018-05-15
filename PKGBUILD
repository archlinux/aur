# Maintainer: Adam Harvey <adam@adamharvey.name>
pkgname=apfs-fuse-git
pkgver=r45.7da8083
pkgrel=1
pkgdesc="FUSE driver for APFS (Apple File System)"
arch=('i686' 'x86_64')
url="https://github.com/sgan81/apfs-fuse"
license=('GPL')
groups=()
depends=('fuse3')
makedepends=('git' 'fuse3' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('apfs-fuse::git+https://github.com/sgan81/apfs-fuse')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
  git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 build/bin/{apfs-dump,apfs-dump-quick,apfs-fuse,lzfse} "$pkgdir/usr/bin"
}
