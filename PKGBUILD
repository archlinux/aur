# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=matchbox-window-manager
pkgver=1.2.2
_commit=844f61069896fe3f549ab425d731c061028f697c
pkgrel=1
pkgdesc="A pretty much unique X window manager with a classic PDA management policy"
arch=('x86_64')
license=('GPL')
depends=('libmatchbox' 'startup-notification' 'libpng' 'libsm' 'libxcursor')
url="http://matchbox-project.org/"
source=("http://git.yoctoproject.org/cgit/cgit.cgi/$pkgname/snapshot/$pkgname-${_commit}.tar.bz2")
sha256sums=('4ac29942f1da25d5b0dc7e62b713746fe0c6596fe885bcb7c8ffa053758cc0e6')

build() {
  cd $pkgname-${_commit}
  ./autogen.sh
  ./configure --sysconfdir=/etc --prefix=/usr \
	--enable-startup-notification --enable-session \
	--enable-alt-input-wins --enable-expat
  CFLAGS=' -fcommon' make
}

package() {
  cd $pkgname-${_commit}
  make DESTDIR="$pkgdir" install
}
