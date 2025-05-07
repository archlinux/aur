# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>

pkgname=crun-krun
pkgver=1.21
pkgrel=2
pkgdesc="A fully featured OCI runtime and C library for running containers. Enabled krun support for secure/confidential containers in VMs."
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64')
provides=('oci-runtime' 'crun')
conflicts=('crun')
depends=('yajl' 'systemd-libs' 'libcap' 'libseccomp' 'criu' 'libkrun')
makedepends=('libtool' 'python' 'go-md2man' 'systemd' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver")
validpgpkeys=('AC404C1C0BF735C63FF4D562263D6DF2E163E1EA')
sha256sums=('c807b5ae99273adff712a2d894896d3cbae9f7ecc985763725c3b0e06d01257b')

build() {
    cd crun
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --enable-dynamic \
        --with-libkrun
        #--with-python-bindings
    make
}

package() {
    cd crun
    make DESTDIR="$pkgdir" install
}
