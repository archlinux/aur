# Maintainer: LinuxLover471 <LinuxLover471 at proton dot me>
# Contributor: melchips <truphemus dot francois at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Olivier Duclos <olivier dot duclos at gmail dot com>

_pkgname=xcompmgr
pkgname=${_pkgname}-git
pkgver=1.1.10.r3.g76c12c6
pkgrel=1
pkgdesc="Composite window effect manager for X.org (git)"
arch=(i686 x86_64)
url="http://www.freedesktop.org/Software/xapps"
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'libxext' 'libxfixes' 'libx11' 'glibc')
makedepends=('git' 'xorg-util-macros')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-dana)
replaces=(${_pkgname} ${_pkgname}-dana)
source=("git+https://gitlab.freedesktop.org/xorg/app/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/xcompmgr\.//'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR=$pkgdir install
}
