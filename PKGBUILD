# Maintainer: Pablo Lezaeta <prflr88 @ gmail . com> (Pony Provider)

pkgname=thunar-nilfs2-plugin-git
_pkgname=thunar-nilfs2-plugin
pkgver=0.git4
pkgrel=1
pkgdesc="You can see a list of checkpoints created by NILFS2 in Thunar"
arch=('i686' 'x86_64')
url="https://github.com/kazuki/thunar-nilfs2-plugin" 
license=('GPL3')
depends=('nilfs-utils')
provides=('thunar-nilfs2-plugin')
conflicts=('thunar-nilfs2-plugin' 'thunar-nilfs2-plugin-git')
makedepends=('git' 'thunar' 'xfce4-dev-tools')
source=("$_pkgname::git+https://github.com/jristz/thunar-nilfs2-plugin.git")
md5sums=("SKIP")

pkgver(){
	cd $_pkgname
	#echo "$(git describe --always --abbrev=0 ).git$(git rev-list --count HEAD | sed 's/-/./g' )"
	echo "0.git$(git rev-list --count HEAD | sed 's/-/./g' )"
}

build(){
	cd $srcdir/$_pkgname
	./autogen.sh --prefix=/usr --bindir=/usr/bin \
		--sbindir=/usr/bin --libdir=/usr/lib \
		--libexecdir=/usr/lib/$_pkgname
	make
}

package(){
	cd $srcdir/$_pkgname
	make DESTDIR=$pkgdir sbindir=/usr/bin install
}

