# Maintainer: Patrick Reader <aur@pxeger.com>

# from https://github.com/archlinux/svntogit-community/blob/packages/crun/trunk/PKGBUILD:
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: hexchian <i at hexchain dot org>

pkgname=crun-python-bindings
pkgver=1.2
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers, including Python bindings"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64')
depends=('yajl' 'systemd-libs' 'libcap' 'libseccomp' 'criu')
makedepends=('libtool' 'python' 'go-md2man' 'systemd' 'git')
source=("https://github.com/containers/crun/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('AC404C1C0BF735C63FF4D562263D6DF2E163E1EA')
sha256sums=('ff159878668b71e5aa0c7ed00f1ed665be81c5ba925bf8ea80ccfab7620975f3'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-dynamic \
        --enable-shared \
        --with-python-bindings
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
