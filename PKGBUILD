# Contributor: Stas Bourakov <sbourakov(at)gmail.com>
pkgname=libdreamdvd
pkgver=20120425
pkgrel=1
pkgdesc="This is a libdvdnav wrapper library which can be used to simply build a dvd player frontend for dream multimedia settop boxes. One of the dependencies for Enigma2 project."
arch=('i686' 'x86_64')
url="https://schwerkraft.elitedvb.net/projects/libdreamdvd"
license=('GPL2')
depends=('gcc-libs')
makedepends=('autoconf' 'automake' 'bison' 'fakeroot' 'flex' 'gcc' 'libtool' 'm4' 'make' 'patch' 'pkg-config' 'git')
source='git://schwerkraft.elitedvb.net/libdreamdvd/libdreamdvd.git'
conflicts=()
md5sums=('SKIP')

#_gitroot='git://schwerkraft.elitedvb.net/libdreamdvd/libdreamdvd.git' 
#_gitname='libdreamdvd'

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {

    cd $srcdir/$pkgname

#    msg "git clone...."
#
#    if [ -d $startdir/src/$_gitname ] ; then
#        cd $_gitname && git pull origin
#        msg "The local files are updated."
#    else
#        git clone $_gitroot
#        cd $_gitname
#    fi
    touch ./libdreamdvd_config.h.in || return 1
    ./autogen.sh || return 1
    ./configure --prefix=/usr || return 1
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}
