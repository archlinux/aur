# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=kcm-about-distro-kde4
_pkgname=about-distro
pkgver=1.1.0
pkgrel=2
pkgdesc="KCM displaying distribution and system information for KDE4"
arch=('i686' 'x86_64')
url="https://projects.kde.org/${_pkgname}"
license=('GPL3')
depends=('kdelibs' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kinfocenter')
source=("${_pkgname}-${pkgver}.tar.xz::http://download.kde.org/stable/${_pkgname}/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz" "kcm-about-distrorc" "arch-logo.png")
sha256sums=('829f97a27a882877cca51cfb084dfdf33670fb1bc9ccbf0b2d05187de87e721b'
            '9c0ca076150c0ed41f68606e6c9e037635666c071738e0323468add80972e04b'
            '045bef73cecc450c95c4cdd0ad99e26d43f997dc66dbc101d9c13f33be5a47fc')

build() {
    cd "$srcdir"
    if [ -d build ] ; then
        rm build -rf
    fi
    mkdir build && cd build
    cmake ../$_pkgname-$pkgver \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/kcm-about-distrorc" "$pkgdir/usr/share/config/kcm-about-distrorc"
    install -Dm644 "$srcdir/arch-logo.png"      "$pkgdir/usr/share/apps/$_pkgname/arch-logo.png"
}
