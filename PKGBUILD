# Fixer-upper: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: baltic <1000Hz.radiowave at google mail>

pkgname=notes-tree
pkgver=1.0
pkgrel=2
pkgdesc="Note taking (knowledge base) app with tree like notes structure"
arch=('i686' 'x86_64' 'aarch64')
url="https://bitbucket.org/baltic/notestree/src"
license=('ZLIB')
depends=('qt5-svg' 'qt5-webkit' 'boost-libs')
makedepends=('boost')
source=("https://bitbucket.org/baltic/notestree/downloads/$pkgname-$pkgver.tar.xz")
noextract=("$pkgname-$pkgver.tar.xz")
sha256sums=('ad81cd9e064e9640783a260e4f19f30e971a7fd5f22ed06272c7c7b04d1ef711')

prepare() {
    # versioned source extraction is nice, but makepkg can't automagically guess
    # how to do this when the source archive doesn't use it.
    mkdir -p "$pkgname-$pkgver"
    tar xf "$pkgname-$pkgver.tar.xz" -C "$pkgname-$pkgver"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    qmake-qt5
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
