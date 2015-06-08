# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=kde-baseapps-git
pkgname=(konqueror-frameworks-git kdepasswd-frameworks-git kdialog-frameworks-git kfind-frameworks-git 
keditbookmarks-frameworks-git libkonq-frameworks-git konq-plugins-frameworks-git)
pkgver=r19777.e511533
pkgrel=1
pkgdesc="Collection of applications used for file and Internet browsing."
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/applications/kde-baseapps'
license=(LGPL)
makedepends=(extra-cmake-modules git kdoctools kdesu kdelibs4support kactivities-frameworks knewstuff python khtml 
kded tidyhtml)
source=('git://anongit.kde.org/kde-baseapps#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd kde-baseapps
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kde-baseapps \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package_konqueror-frameworks-git() {
	pkgdesc='KDE File Manager & Web Browser'
	depends=(keditbookmarks-frameworks-git dolphin-git kded)
	url="http://kde.org/applications/system/konqueror/"
	conflicts=(kdebase-konqueror konqueror)
	provides=(konqueror)
	install=$pkgbase.install
	cd $srcdir/build/konqueror
	make DESTDIR="$pkgdir" install
}

package_kdepasswd-frameworks-git() {
	pkgdesc='Change Password'
	depends=(kwidgetsaddons kdesu)
        conflicts=(kdebase-kdepasswd kdepasswd)
        provides=(kdepasswd)
	cd $srcdir/build/kdepasswd
	make DESTDIR="$pkgdir" install
}

package_kdialog-frameworks-git() {
	pkgdesc='A utility for displaying dialog boxes from shell scripts'
	depends=(kdelibs4support)
        conflicts=(kdebase-kdialog kdialog)
        provides=(kdialog)
	cd $srcdir/build/kdialog
	make DESTDIR="$pkgdir" install
}

package_kfind-frameworks-git() {
	pkgdesc='Find Files/Folders'
	depends=(libkonq-frameworks-git)
        conflicts=(kdebase-kfind kfind)
        provides=(kfind)
	url="http://kde.org/applications/utilities/kfind/"
	install=$pkgbase.install
	cd $srcdir/build/kfind
	make DESTDIR="$pkgdir" install
}

package_keditbookmarks-frameworks-git() {
        pkgdesc='Bookmark organizer and editor'
        depends=(libkonq-frameworks-git)
        conflicts=(kdebase-keditbookmarks keditbookmarks)
        provides=(keditbookmarks)
        url="http://www.kde.org/"
	install=$pkgbase.install
        cd $srcdir/build/keditbookmarks
        make DESTDIR="$pkgdir" install
}

package_libkonq-frameworks-git() {
	pkgdesc='KDE libraries for the basic desktop applications'
	depends=(kdelibs4support)
	conflicts=(kdebase-lib)
	cd $srcdir/build/lib
	make DESTDIR="$pkgdir" install
}

package_konq-plugins-frameworks-git() {
        pkgdesc='Extra plugins for Konqueror'
        depends=(kdelibs4support khtml tidyhtml)
        conflicts=(kdebase-konq-plugins konq-plugins)
        provides=(konq-plugins)
        install=$pkgbase.install
        cd $srcdir/build/konq-plugins
        make DESTDIR="$pkgdir" install
}

