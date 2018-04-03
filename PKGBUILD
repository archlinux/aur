# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krusader-git
pkgver=2.6.1.beta.r5815.g706b9f78
pkgrel=1
pkgdesc="Advanced twin panel file manager for KDE. (GIT version)"
arch=('x86_64')
url='http://www.krusader.org'
license=('GPL')
depends=('karchive' 'kbookmarks' 'kcodecs' 'kcompletion' 'kcoreaddons' 'kconfig'
         'kdoctools' 'ki18n' 'kiconthemes' 'kitemviews' 'kio' 'knotifications'
         'kparts' 'solid' 'ktextwidgets' 'kwallet' 'kwidgetsaddons' 'kwindowsystem'
         'kxmlgui' 'kguiaddons' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'python' 'git')
optdepends=(
            # archive formats
            # look for KrServices::cmdExist calls
            'xz: LZMA and XZ archive support'
            'unzip: ZIP decompression support'
            'zip: ZIP archive support'
            'lhasa: LHA archive support'
            'cpio: cpio archive support'
            'unrar: RAR decompression support'
            'rar: RAR archive support'
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
            'konsole: terminal'
            'ktexteditor: file editing support'
)
provides=('krusader')
conflicts=('krusader')
source=('git://anongit.kde.org/krusader')
sha1sums=('SKIP')

pkgver() {
  cd krusader
  _ver="$(cat CMakeLists.txt | grep -m1 'set(VERSION' | cut -d '"' -f2 | tr - .)"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd krusader
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDESU_PATH="/usr/lib/kf5/kdesu"
  make
}

package() {
  cd krusader
  make DESTDIR="$pkgdir" install
}
