# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=twin-git
pkgver=0.9.0.r2.gd7a8318
pkgrel=1
pkgdesc="A text-mode window environment"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://sourceforge.net/projects/twin/"
license=(GPL2 LGPL2.1)
depends=(gpm libxpm)
makedepends=(git)
provides=(twin)
conflicts=(twin)
options=(!makeflags)
source=("git+https://github.com/cosmos72/twin")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  LDFLAGS="-lX11" ./configure --prefix=/usr --sbindir=/usr/bin \
	--enable-tt=yes \
	--enable-tt-hw-twin=yes \
    --enable-tt-hw-twin-tunnel=yes \
    --enable-tt-hw-twin-detunnel=yes \
	--enable-tt-hw-xml=yes
  make
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  make DESTDIR="${pkgdir}" install
}
