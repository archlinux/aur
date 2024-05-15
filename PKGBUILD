# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>

_pkgname=libdatachannel
pkgname="$_pkgname-nice"
pkgver=0.21.1
pkgrel=1
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64' 'aarch64')
url="https://github.com/paullouisageneau/$_pkgname"
license=(MPL-2.0)
makedepends=('git' 'cmake' 'plog')
depends=('glibc' 'glib2' 'gcc-libs' 'openssl' 'libnice' 'libsrtp' 'libusrsctp')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git+https://github.com/paullouisageneau/$_pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DPREFER_SYSTEM_LIB=ON \
        -DUSE_NICE=ON \
        -DNO_TESTS=ON \
        -DNO_EXAMPLES=ON \
        -Wno-dev

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

