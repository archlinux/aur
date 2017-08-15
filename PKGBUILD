# Maintainer: Raimar Buehmann (raimar)

pkgname=lxtask-git
pkgver=0.1.8.r411.20170815
pkgrel=1
pkgdesc="Lightweight X11 task manager and system monitor for LXDE"
arch=('i686' 'x86_64')
license=('GPL2')
groups=('lxde-git')
depends=('gtk2')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'pkgconfig' 'git' 'intltool')
provides=('lxtask')
conflicts=('lxtask')
replaces=('lxtask')
url="http://lxde.org/"
source=(
	$pkgname::git+https://github.com/OpenHelios/lxtask.git
#	https://downloads.sourceforge.net/lxde/lxtask-0.1.8.tar.xz
#	$pkgname::git+https://git.lxde.org/git/lxde/lxtask.git
#	$pkgname::git+git://git.lxde.org/git/lxde/lxtask.git
)
sha256sums=(
	'SKIP'
)

_gitroot=$pkgname

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $_gitroot
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r411.$_commitTime"
}

build() {
	cd $_gitroot
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd $_gitroot
	make DESTDIR="$pkgdir" install
}
