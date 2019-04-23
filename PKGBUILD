
# Maintainer: Lukas Harbauer <lukas.harbauer@mailbox.org>
pkgname=visicut-git
pkgver=1.8.r65.5e579108
pkgrel=1
epoch=
pkgdesc="a userfriendy, platform-independent tool for preparing, saving and sending jobs to Lasercutters, from git master"
arch=(any)
url="https://visicut.org/"
license=('LGPL')
groups=()
depends=()
makedepends=('ant>=1.10.5'
             'git')
checkdepends=()
optdepends=('ant: Java Building tool')
provides=(visicut)
conflicts=(visicut)
replaces=()
backup=()
options=()
install=
changelog=
source=('VisiCut.git::git://github.com/t-oster/VisiCut.git')
noextract=()
md5sums=(SKIP)
validpgpkeys=(DF29C7472CA45E978A05883A69EBE9F6052F7F81)
_gitname="VisiCut.git"

pkgver(){
    cd "$_gitname"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
prepare(){
    cd "$_gitname"
    git submodule init
    git submodule update
}
build() {
	cd "$_gitname"
	    make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install
}
