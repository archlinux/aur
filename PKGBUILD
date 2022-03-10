# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
pkgname="simplex-chat-git"
pkgver=v1.3.1.r18.gc6a49b0
pkgrel=1
epoch=
pkgdesc=""
arch=("x86_64")
url="https://github.com/simplex-chat/simplex-chat"
license=('AGPL3')
groups=()
depends=()
makedepends=('stack' 'git')
checkdepends=()
optdepends=()
provides=('simplex-chat')
conflicts=('simplex-chat')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/simplex-chat/simplex-chat.git#branch=stable)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}


builddir="${pkgname/-git/}"
build() {
	cd "$builddir"
   rm -rf .stack-work
   stack build
}

pkgver(){
	cd "$builddir"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#check() {
#	cd "$builddir"
#   stack test
#}

package() {
	cd "$builddir"
   # TODO figure out how to use 'stack' to install to /usr/local/bin
   # Or at least figure out how to find the built binary withing using find...
   # stack install
   app=$(find ./.stack-work/dist/ -type f -executable -name simplex-chat)
   echo $app
   #mkdir -p ${pkgdir}/usr/local/bin
   install -D $app ${pkgdir}/usr/local/bin/simplex-chat
}
