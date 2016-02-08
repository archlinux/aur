# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository if you add following to /etc/pacman.conf
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

pkgname=subtitlecomposer
pkgver=0.5.9
pkgrel=1
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${pkgname}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kio' 'kross' 'kxmlgui' 'ki18n')
# Comment/uncomment the following dependencies to disable/enable support for
# MPV, gstreamer and/or Xine backend.
# These are not optdepends as they must be present at build time.
# Also ensure these deps aren't installed if you don't want to link against them
# because Subtitle Composer will always link against them if available.
#depends+=('mpv')
depends+=('gstreamer')
depends+=('xine-lib')
makedepends=('extra-cmake-modules')
install=${pkgname}.install
optdepends=('mplayer: for MPlayer backend'
            'ruby: for scripting'
            'python: for scripting')
source=("https://github.com/maxrd2/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e2ce6a23b58645401dd3df6f2cd27f1f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
} 
