# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository
# if you add following to /etc/pacman.conf (x86_64 only)
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

pkgname=subtitlecomposer
pkgver=0.6.5
pkgrel=2
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${pkgname}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'gstreamer')
makedepends=('extra-cmake-modules')

# Comment/uncomment the following dependencies to disable/enable
# building the plugins for MPV and Xine player backends and pocketsphinx
makedepends+=('xine-lib')
makedepends+=('mpv')
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('mplayer: MPlayer backend'
            'mpv: MPV backend'
            'xine-lib: Xine backend'
            'pocketsphinx: speech recognition'
            'kross-interpreters: for ruby and python scripting support'
            'ruby: scripting'
            'python: scripting')

source=("https://github.com/maxrd2/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('26503c5f7ede37f482bd2da6b4acc8df83c0e5c18f38df011ce0f567a1422563')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
