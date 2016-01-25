# Maintainer: Tomoki Imai <tomo832@gmail.com>
pkgname=obs-rtmp-nicolive-git
pkgver=v2.0.r4.g4e72420
pkgdesc="RTMP NicoLive Plugin for OBS MultiPlatform"
arch=('i686' 'x86_64')
url="https://github.com/raccy/obs-rtmp-nicolive"
license=('MIT')
groups=()
depends=('obs-studio')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("$pkgname"::'git://github.com/raccy/obs-rtmp-nicolive'
        '01_no_libcurl.patch')
md5sums=('SKIP'
         '748f4978ef449e8a551033069b94979e')
pkgrel=1



pkgver() {
    cd "$srcdir/$pkgname"
    # Use the tag of the last commit
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/$pkgname"
    patch -u < ../01_no_libcurl.patch
}
build() {
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

