# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: Felice Murolo <linuxboy@fel.hopto.org>
_pkgname=kencfs
pkgname=$_pkgname-kf5
pkgver=1.5.0
pkgrel=1
#epoch=
pkgdesc="GUI frontend for encfs. Create, mount, umount and delete your encrypted fs. KF5 version."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KEncFS?content=134003"
license=('(L)GPL')
#groups=()
depends=('encfs>=1.7.4-8' 'fuse>=2.9.2-1' 'knotifications' 'kconfig' 'kwallet')
#makedepends=()
#checkdepends=()
#optdepends=()
provides=(kencfs)
conflicts=(kencfs)
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=($_pkgname-$pkgver.tar.gz port_to_qt5.patch)
noextract=()
md5sums=('cbcde8d0eb3eb351a6de5f7e706ae424'
        '5c2cd7826eae3d249ed7909e0c2f0af3') #generate with 'makepkg -g'

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../port_to_qt5.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  qmake-qt5
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  #make DESTDIR="$pkgdir/" install
  make INSTALL_ROOT=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et: