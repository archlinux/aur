# Contributor: Patrick Hanckmann <hanckmann at gmail.com>
# Maintainer: Patrick Hanckmann <hanckmann at gmail.com>
pkgname=zyre-git
pkgver=20161108
pkgrel=1
pkgdesc="Zyre - an open-source framework for proximity-based peer-to-peer applications (ZeroMQ)"
arch=(i686 x86_64)
url="https://github.com/zeromq/zyre"
license=('LGPL')
depends=('czmq-git')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
source=(git+https://github.com/zeromq/zyre)
sha256sums=('SKIP')
provides=(zyre)
conflicts=(zyre)

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/zyre \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/zyre \
    --localstatedir=/var/lib/zyre \
    --disable-zmakecert \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
