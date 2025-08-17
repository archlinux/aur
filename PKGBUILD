# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>

pkgname=crun-krun
pkgver=1.23.1
pkgrel=1
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
sha256sums=('616cc7fdff3c6aa0429a9f2ab017a9b234ff8bda401250727879c9b4a9e35a76')

build() {
    cd crun
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --enable-dynamic \
        --with-libkrun \
        --with-python-bindings
    make
}

package() {
    cd crun
    make DESTDIR="$pkgdir" install
}
