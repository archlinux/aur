# $Id: PKGBUILD 264438 2016-04-09 13:49:25Z foutrelis $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Daniel Balieiro <daniel@balieiro.com>
# Contributor: Rodrigo L. M. Flores <mail@rodrigoflores.org>
_pkgname=telepathy-gabble
pkgname=${_pkgname}-xep0198-git
pkgver=0.18.1.r185.gfc4a8c7
pkgrel=1
pkgdesc="A Jabber/XMPP connection manager for Telepathy with XEP-0198_Stream_Management"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org"
groups=('telepathy')
license=('LGPL2.1')
depends=('telepathy-glib' 'libsoup' 'libnice' 'sqlite')
makedepends=('libxslt' 'python2')
conflicts=($_pkgname)
provides=($_pkgname)
options=('!emptydirs')
source=(git+https://github.com/Thaodan/telepathy-gabble.git#branch=wocky_update)
md5sums=('SKIP')
install=telepathy-gabble.install

pkgver()
{
  cd $_pkgname
  git describe --always --long | sed -E 's/telepathy-gabble.//;s/([^-]*-g)/r\1/;s/-/./g;'

}

prepare()
{
  cd $_pkgname
  ./autogen.sh  --no-configure
}
build() {
  cd $_pkgname
  PYTHON=/usr/bin/python ./configure --prefix=/usr \
  	--libexecdir=/usr/lib/telepathy \
        --disable-Werror   
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
