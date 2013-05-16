# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>
pkgname=ogrebullet-git
pkgver=20130512
pkgrel=1
pkgdesc="Bullet Physics wrapper for OGRE"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/addonforums/viewtopic.php?f=12&t=4155"
license=('lgpl')
depends=(ogre bullet boost)
makedepends=(git cmake)
source=(git+https://bitbucket.org/alexeyknyshev/ogrebullet.git)
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
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
