# Maintainer: Han <maghsk2017@gmail.com>
# Contributor: Mattéo Delabre <spam@delab.re>
pkgname=qnodeeditor
_reponame=QNodeEditor
pkgver=2.1.7
pkgrel=1
pkgdesc="Qt-based library aimed at graph-controlled data processing (qv2ray edition)"
arch=(x86_64)
url="https://github.com/Qv2ray/QNodeEditor"
license=(BSD)
depends=(qt5-base)
makedepends=(cmake)
conflicts=('nodeeditor')
provides=('nodeeditor')
_commit=6f1d2f559bc9df42f9165067766f20578cf934e3
source=("https://github.com/Qv2ray/$_reponame/archive/$_commit.zip")
sha256sums=('e224ecf7d71880d297dd0f1e9b4a1bf6ebf6d1ae829d7a73a9744e5d67b0cd3f')

build() {
    cmake -B build -S "$_reponame-$_commit" \
        -DBUILD_TESTING=ON \
        -DBUILD_EXAMPLES=OFF \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -j -C build
}

check() {
    make -j -C build test
}

package() {
    make -j DESTDIR="$pkgdir/" -C build install
    install -Dm 644 -t "$pkgdir/usr/share/licenses/nodeeditor" "$_reponame-$_commit/LICENSE"
}
