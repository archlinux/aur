# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor : Stein Krauz <steinkrauz@yahoo.com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>
# Contributor: Skunnyk <skunnyk@archlinux.fr>
# Contributor : Pablo Lezaeta <prflr88@gmail.com>

_pkgname=squeeze
_pkgbasever=0.4.90git
pkgname=squeeze-git
pkgver=0.4.90git.r1032.af38709
pkgrel=1
pkgdesc="Squeeze is  a modern and advanced archive manager for the Xfce Desktop Environment"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-git')
makedepends=('git' 'xfce4-dev-tools' 'pkgconfig' 'gtk-doc' 'intltool' 'xfconf')
depends=('libxfce4util' 'hicolor-icon-theme' 'dbus-glib' 'gtk2' 'gtk3' 'desktop-file-utils')
optdepends=(
	'lzop: .tar.lzo handling'
	'xz: tar.xz handling'
)
conflicts=('squeeze')
provides=("squeeze" "squeeze-git")
options=('!libtool')
install=squeeze.install
#branch=("stephan/new-ui")
_branch=("master")
source=(git+git://git.xfce.org/apps/squeeze#branch=$_branch)
sha256sums=('SKIP')

pkgver(){
  cd $srcdir/$_pkgname
  #echo "$_pkgbasever.$(git rev-parse --short HEAD)"
   printf "%s.r%s.%s" $_pkgbasever "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build(){
  cd $srcdir/$_pkgname

  mkdir -p m4

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$_pkgname \
  --localstatedir=/var --bindir=/usr/bin --sbindir=/usr/bin \
  --libdir=/usr/lib --disable-debug

  make
}

package() {
	cd $srcdir/$_pkgname
	make DESTDIR=$pkgdir sbindir=/usr/bin install
}

