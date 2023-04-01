# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=twin
pkgver=0.9.0
pkgrel=2
pkgdesc="A text-mode window environment"
arch=('x86_64')
url='https://sourceforge.net/projects/twin/'
license=('GPL2' 'LGPL2.1')
depends=('gpm' 'zlib' 'libxpm')
options=('!makeflags')
source=("$pkgname-$pkgver.tgz::https://github.com/cosmos72/twin/archive/v${pkgver}.tar.gz")
sha256sums=('10b1acac5ee88f3cf0d9c5ba238db9cb3e20a009fea7fe66cfa14d59b473f8fe')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="-lX11" ./configure --prefix=/usr --sbindir=/usr/bin \
	--enable-tt=yes \
	--enable-tt-hw-twin=yes \
	--enable-tt-hw-twin-tunnel=yes \
	--enable-tt-hw-twin-detunnel=yes \
	--enable-tt-hw-xml=yes
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
