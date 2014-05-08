# Mantainer: Adria Arrufat <swiftscythe@gmail.com>

pkgname=gigolo-git
pkgver=20100915
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
arch=(i686 x86_64)
license=('GPL2')
url="http://thunar.xfce.org"
groups=('xfce4-git')
depends=('gtk2' 'gvfs')
makedepends=('gettext' 'git' 'intltool' 'python')
conflicts=('gigolo')
provides=("gigolo")
source=()
md5sums=()


_gitroot="git://git.xfce.org/apps/gigolo"
_gitname="gigolo"
build() {
    
    cd $srcdir
    msg "Getting sources..."
    
    if [ -d "$srcdir/$_gitname" ] ; then
	 cd $_gitname && git pull origin
	 msg "The local files are updated."
	else
	 git clone $_gitroot
	fi

msg "GIT checkout done or server timeout"
msg "Starting build..."

	cd $srcdir/$_gitname
    
  ./autogen.sh  
  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd $srcdir/$_gitname
  make DESTDIR=${pkgdir} install
}

