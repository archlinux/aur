# Maintainer: Ignat Loskutov <ignat.loskutov@gmail.com>
pkgbase='deadbeef-replaygain-control-git'
_gitname='ddb_replaygain_control'
pkgname=('deadbeef-replaygain-control-gtk2-git' 'deadbeef-replaygain-control-gtk3-git')
pkgver=6.c0788d4
pkgrel=1
_pkgdesc="Customizable toolbar plugin for DeadBeeF music player."
arch=('i686' 'x86_64')
url="https://github.com/cboxdoerfer/ddb_replaygain_control"
license=(GPL2)
depends=('deadbeef>=0.6')
makedepends=(git)
source=('git+https://github.com/cboxdoerfer/ddb_replaygain_control.git'
        'build.patch')
md5sums=('SKIP'
        'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
    cd $srcdir/$_gitname
    patch -p1 < ../build.patch
}

build() {
  cd $srcdir/$_gitname
  make gtk2
  make gtk3
}

package_deadbeef-replaygain-control-gtk2-git() {
  pkgdesc=$_pkgdesc' The GTK2 version.'
  install -D -m644 $srcdir/$_gitname/gtk2/ddb_misc_replaygain_control_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_replaygain_control_GTK2.so
}

package_deadbeef-replaygain-control-gtk3-git() {
  pkgdesc=$_pkgdesc' The GTK3 version.'
  install -D -m644 $srcdir/$_gitname/gtk3/ddb_misc_replaygain_control_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_replaygain_control_GTK3.so
}
