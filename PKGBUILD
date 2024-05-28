# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krusader-git
pkgver=2.9.0.dev.r6977.g5a449a38
pkgrel=1
pkgdesc="Advanced twin panel file manager for KDE. (GIT version)"
arch=('x86_64')
url='http://www.krusader.org'
license=('GPL')
depends=(acl
         gcc-libs
         glibc
         karchive5
         kbookmarks5
         kcodecs5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kguiaddons5
         ki18n5
         kiconthemes5
         kio5
         kitemviews5
         kjobwidgets5
         knotifications5
         kparts5
         kservice5
         ktextwidgets5
         kwallet5
         kwidgetsaddons5
         kwindowsystem5
         kxmlgui5
         qt5-base
         solid5
         zlib)
makedepends=(extra-cmake-modules
             kdoctools5
             git)
optdepends=('xz: LZMA and XZ archive support'
            'unzip: ZIP decompression support'
            'zip: ZIP archive support'
            'lhasa: LHA archive support'
            'cpio: cpio archive support'
            'unrar: RAR decompression support'
            'arj: ARJ archive support'
            'unarj: ARJ decompression support'
            'unace: ACE decompression support'
            'p7zip: 7z archive support'
            # additional apps
            'keditbookmarks: Manage Bookmarks functionality'
            'kde-cli-tools: manage file associations, root mode'
            'kompare: file contents comparison'
            'kdiff3: file contents comparison'
            'krename: advanced rename tool'
            'konsolepart5: terminal'
            'ktexteditor5: file editing support')
provides=('krusader')
conflicts=('krusader')
source=('git+https://anongit.kde.org/krusader')
sha1sums=('SKIP')

pkgver() {
  cd krusader
  _ver="$(cat CMakeLists.txt | grep -m1 'set(VERSION' | cut -d '"' -f2 | tr - .)"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S krusader \
    -DKDESU_PATH="/usr/lib/kf6/kdesu"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
