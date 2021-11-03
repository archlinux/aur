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
pkgver=0.7.1
pkgrel=1
pkgdesc='Video subtitle editor'
arch=('i686' 'x86_64')
url="https://invent.kde.org/kde/${pkgname}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'ffmpeg')
makedepends=('extra-cmake-modules')

# Comment/uncomment the following dependencies to disable/enable
# building the plugins for MPV and Xine player backends and pocketsphinx
makedepends+=('xine-lib')
makedepends+=('mpv')
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('gstreamer: GStreamer videoplayer backend'
            'mpv: MPV videoplayer backend'
            'mplayer: MPlayer videoplayer backend'
            'phonon-qt5: Phonon videoplayer backend'
            'xine-lib: Xine videoplayer backend'
            'pocketsphinx: Pocketsphinx speech recognition backend'
            'kross-interpreters: Ruby and Python scripting support'
            'ruby: scripting'
            'python: scripting')

source=("https://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "https://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.xz.sig")
sha256sums=('ef9cb3c0c1fe1f40cf9d8e795859b9b28adf2da3be77a076d46bc28df4cd0255'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -S . -B build
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
}
