# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=kde-baseapps-git
pkgname=(konqueror-git kdepasswd-git kdialog-git kfind-git keditbookmarks-git)
pkgver=r21051.4f5cf29
pkgrel=1
pkgdesc="Collection of applications used for file and Internet browsing"
arch=(i686 x86_64)
url='https://www.kde.org/'
license=(LGPL)
makedepends=(extra-cmake-modules git kdoctools kdesu kdelibs4support kactivities knewstuff python khtml kded tidy
             kdesignerplugin qt5-webengine mesa kcmutils)
source=('git://anongit.kde.org/kde-baseapps')
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package_konqueror-git() {
	pkgdesc='KDE File Manager & Web Browser'
	depends=(keditbookmarks-git dolphin qt5-webengine)
	url="http://kde.org/applications/system/konqueror/"
	conflicts=(kdebase-konqueror konqueror konqueror-frameworks-git konq-plugins-git konq-plugins-frameworks-git
                   libkonq-git libkonq-frameworks-git konq-plugins)
	provides=(konqueror)
        replaces=(konq-plugins-git libkonq-git)
        optdepends=('tidy: Tidy HTML plugin' 'kdesu: shell command plugin')
	cd build/konqueror
	make DESTDIR="$pkgdir" install
}

package_kdepasswd-git() {
	pkgdesc='Change Password'
	depends=(kwidgetsaddons kdesu)
        conflicts=(kdebase-kdepasswd kdepasswd kdepasswd-frameworks-git)
        provides=(kdepasswd)
	cd build/kdepasswd
	make DESTDIR="$pkgdir" install
}

package_kdialog-git() {
	pkgdesc='A utility for displaying dialog boxes from shell scripts'
	depends=(kdelibs4support)
        conflicts=(kdebase-kdialog kdialog kdialog-frameworks-git)
        provides=(kdialog)
	cd build/kdialog
	make DESTDIR="$pkgdir" install
}

package_kfind-git() {
	pkgdesc='Find Files/Folders'
	depends=(kdelibs4support hicolor-icon-theme)
        conflicts=(kdebase-kfind kfind kfind-frameworks-git)
        provides=(kfind)
	url="http://kde.org/applications/utilities/kfind/"
	cd build/kfind
	make DESTDIR="$pkgdir" install
}

package_keditbookmarks-git() {
        pkgdesc='Bookmark organizer and editor'
        depends=(kparts)
        conflicts=(kdebase-keditbookmarks keditbookmarks keditbookmarks-frameworks-git)
        provides=(keditbookmarks)
        url="http://www.kde.org/"
        cd build/keditbookmarks
        make DESTDIR="$pkgdir" install
}
