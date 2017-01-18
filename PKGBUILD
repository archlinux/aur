# $Id$
# Maintainer: John Andersen <johnandersenpdx@gmail.com>

pkgname=qemu-lite
pkgver=2.7.1
pkgrel=1
pkgdesc="QEMU with pc-lite system"
arch=(x86_64)
url="https://github.com/01org/qemu-lite"
license=('GPLv2')
depends=('libcacard'
        'pixman'
        'vde2'
        'virglrenderer'
        'numactl')
makedepends=('python2')
conflicts=('qemu')
source=(https://github.com/01org/qemu-lite/archive/${pkgver}${__postfix_ver}.tar.gz)
sha1sums=('337c4073c98e637c52a085913fba885f2525e5e6')

build() {
  cd $pkgname-${pkgver}${__postfix_ver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --disable-libssh2 --disable-tcmalloc --disable-glusterfs --disable-seccomp \
    --disable-{bzip2,snappy,lzo} --disable-usb-redir --disable-libusb \
    --disable-libnfs --disable-tcg-interpreter --disable-debug-tcg \
    --disable-libiscsi --disable-rbd --disable-spice --disable-attr \
    --disable-cap-ng --disable-linux-aio --disable-uuid --disable-brlapi \
    --disable-vnc-{jpeg,png,sasl} --disable-rdma --disable-bluez --disable-fdt \
    --disable-curl --disable-curses --disable-sdl --disable-gtk --disable-tpm \
    --disable-vte --disable-vnc --disable-xen --disable-opengl --disable-slirp \
    --target-list=x86_64-softmmu --python=$(which python2)
  make
}

check() {
  cd $pkgname-${pkgver}${__postfix_ver}
  # make check
}

package() {
  cd $pkgname-${pkgver}${__postfix_ver}
  make DESTDIR="$pkgdir/" install
}
