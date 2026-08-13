pkgname=autoremesher-git
pkgver=r9616134
pkgrel=2
pkgdesc="Cross-platform automatic quad remeshing tool"
arch=(x86_64)
url="https://github.com/huxingyi/autoremesher"
license=(MIT)
depends=("hicolor-icon-theme" "libglvnd" "qt5-base" "tbb" "zlib")
makedepends=("git")
conflicts=("autoremesher")
provides=("autoremesher")

source=("autoremesher-git::git+https://github.com/huxingyi/autoremesher.git#branch=master")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/autoremesher-git"
printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
# Build AutoRemesher
cd "$srcdir/autoremesher-git"
qmake-qt5 CONFIG+=release
make
}

package() {
# Install AutoRemesher
cd "$srcdir/autoremesher-git"
install -Dm755 autoremesher "$pkgdir/usr/bin/autoremesher"
install -Dm644 ci/autoremesher.desktop \
  "$pkgdir/usr/share/applications/autoremesher.desktop"
install -Dm644 ci/autoremesher.png \
  "$pkgdir/usr/share/icons/hicolor/512x512/apps/autoremesher.png"
install -Dm644 ci/autoremesher.appdata.xml \
  "$pkgdir/usr/share/metainfo/autoremesher.appdata.xml"
install -Dm644 LICENSE \
  "$pkgdir/usr/share/licenses/autoremesher-git/LICENSE"
}