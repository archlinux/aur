# Maintainner: bash000000 <hidden>

pkgname=crun-krun-wasm
_pkgname=crun
pkgver=1.21
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64')
provides=('oci-runtime' 'crun')
conflicts=('crun')
depends=('yajl' 'systemd-libs' 'libcap' 'libseccomp' 'criu' 'libkrun' 'wasmer' 'spin' 'lua')
makedepends=('libtool' 'python' 'go-md2man' 'systemd' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver?signed")
validpgpkeys=('AC404C1C0BF735C63FF4D562263D6DF2E163E1EA')
sha256sums=('c807b5ae99273adff712a2d894896d3cbae9f7ecc985763725c3b0e06d01257b')

build() {
    cd "$_pkgname"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --enable-dynamic \
        --with-python-bindings \
	--with-libkrun \
	--with-wasmer \
	--with-spin \
	--with-lua-bindings
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
