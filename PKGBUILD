# Maintainer: Alexander Kirchberger <kirchbergeralex0@gmail.com>
pkgname='rsimg-git' # '-bzr', '-git', '-hg' or '-svn'
_pkgname='rsimg' 
pkgver='r17.33bf3a2'
pkgrel=1
pkgdesc="Terminal image viewer with unicode characters"
arch=('x86_64')
url="https://github.com/kirchberger/rsimg"
license=('GPL')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=('rsimg::https://github.com/kirchberger/rsimg.git')
sha256sums=('SKIP')
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
#	cd "$pkgname"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
#	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

#check() {
	#cd "$pkgname"

	#export RUSTUP_TOOLCHAIN=stable
  #cargo test --frozen 
#}

package() {
#	cd "$pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
