# Maintainer: Patrick Reader <aur@pxeger.com>

# from https://github.com/archlinux/svntogit-community/blob/packages/crun/trunk/PKGBUILD:
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: hexchian <i at hexchain dot org>

pkgname=crun-python-bindings
pkgver=1.0
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers, including Python bindings"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64')
depends=('yajl' 'systemd-libs' 'libcap' 'libseccomp' 'python')
makedepends=('libtool' 'python' 'go-md2man' 'systemd')
optdepends=(
    'criu: checkpoint support'
)
provides=('crun')
conflicts=('crun')
source=("https://github.com/containers/crun/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('AC404C1C0BF735C63FF4D562263D6DF2E163E1EA')
sha256sums=('1db52e6a9c34d44dc49da6a35ac989d59865cec3267e443696f0ed1f4db31103'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-dynamic \
        --with-python-bindings
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
