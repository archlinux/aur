# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/ogrebullet-git

pkgname=ogrebullet-git
pkgver=20130516
pkgrel=1
pkgdesc="Bullet Physics wrapper for OGRE"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/OgreBullet"
license=('lgpl')
depends=(ogre bullet boost)
makedepends=(git cmake)
source=(git+https://bitbucket.org/alexeyknyshev/ogrebullet.git)
sha1sums=('SKIP')
conflicts=('ogrebullet-svn')
provides=('ogrebullet')


pkgver() {
  cd "$srcdir/ogrebullet"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
  # Temporary fix, about to be integrated upstream
  sed -i 's,set(${PROJ}_BUILD_DEMOS,option(${PROJ}_BUILD_DEMOS,' ${srcdir}/ogrebullet/CMakeLists.txt
}

build() {
  cd "${srcdir}/ogrebullet"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DOgreBullet_BUILD_DEMOS=OFF
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/ogrebullet"
  make DESTDIR=${pkgdir} install 
}
