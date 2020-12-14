# Maintainer: zan <zan@420blaze.it>

pkgname=krita-beta
_basever=4.4.2
_subver=beta1
pkgver="$_basever.$_subver"
pkgrel=1
pkgdesc="Edit and paint images - beta release"
arch=(x86_64)
url="https://krita.org"
license=(GPL3)
depends=(kio kseexpr fftw hicolor-icon-theme libraw gsl boost-libs exiv2 openexr poppler-qt5 opencolorio libheif quazip giflib)
makedepends=(extra-cmake-modules kdoctools python boost eigen)
optdepends=()
provides=(krita)
conflicts=(krita)
_target="krita-$_basever-$_subver"
source=("https://download.kde.org/unstable/krita/$_basever-$_subver/$_target.tar.xz"
        'avif.patch'
        'krita-c++14.patch')
sha256sums=('6d6881be0da3bde43ba74488013c0795fbbd9d85e25042799b0821ea2eedcab9'
            '9a1cd95721ff342de87fe68c894455a0151a8f5115a5b9cda0ab9c683157e94e'
            'de84c3c1685e48392d4fb07daab56068cacfc2a846a52a9915b5f3e08357abd1')

prepare() {
    patch -d ${pkgname%-beta}-$_basever-$_subver -p1 -i ../avif.patch
    patch -d ${pkgname%-beta}-$_basever-$_subver -p1 -i ../krita-c++14.patch
}

build() {
    cmake -B build -S $_target
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
