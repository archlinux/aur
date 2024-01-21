# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-file-manager-git
pkgver=6.0.40.r7.g1319bb076
pkgrel=1
pkgdesc='Deepin File Manager'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-file-manager"
license=('GPL3')
# deepin-appearance: org.deepin.dde.Appearance1
depends=('dtkcore' 'dtkgui' 'dtkwidget' 'deepin-anything' 'deepin-util-dfm' 'qt5-base' 'qt5-svg'
         'qt5-x11extras' 'deepin-pdfium' 'docparser' 'libsecret' 'zlib' 'dconf' 'openssl' 'glib2'
         'libxcb' 'libx11' 'qt5-multimedia' 'cryptsetup' 'lucene++' 'avfs' 'gsettings-qt'
         'polkit-qt5' 'poppler' 'kcodecs5' 'taglib' 'util-linux-libs' 'icu' 'pcre' 'glibc' 'gcc-libs'
         'deepin-appearance' 'deepin-qt-dbus-factory' 'cryfs' 'socat')
makedepends=('boost' 'cmake' 'ninja' 'qt5-tools' 'deepin-dock' 'deepin-movie' 'deepin-gettext-tools')
optdepends=('deepin-manual: for help menual'
            'deepin-shortcut-viewer: for shortcut display'
            'deepin-screensaver: for screensaver chooser'
            'deepin-movie: for video preview'
            'deepin-terminal: for opening in terminal'
            'deepin-compressor: for compress/decompress')
optdepends=('deepin-manual: for help menual'
            'deepin-shortcut-viewer: for shortcut display'
            'deepin-screensaver: for screensaver chooser'
            'deepin-movie: for video preview'
            'deepin-terminal: for opening in terminal'
            'deepin-compressor: for compress/decompress')
groups=('deepin-git')
provides=('deepin-file-manager')
conflicts=('deepin-file-manager')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-file-manager")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # cmake confused with glob files, see https://github.com/linuxdeepin/developer-center/issues/5158
  cmake -GNinja -B build -S $pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc
  cmake --build build
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
