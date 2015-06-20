# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-git
provides=($_pkgname)
conflicts=($_pkgname)
_gitname=$_pkgname
source=("git://git.xfce.org/xfce/${_pkgname}")
md5sums=('SKIP')

pkgver=20150313
pkgrel=1
pkgdesc="The Xfce development tools"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
depends=('pkg-config' 'gtk-doc' 'make' 'intltool')
makedepends=('git')
options=('!libtool')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {    
  cd "${srcdir}/${_gitname}"

  msg "Starting build..."
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR=${pkgdir} install
}
