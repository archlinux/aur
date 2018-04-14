# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>

pkgname=guake-gtk2-git
_appname=guake
pkgver=0.8.12
pkgrel=1
pkgdesc="Top-down terminal for Gnome"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Guake/guake"
license=('GPL')
depends=('python2' 'pygtk' 'python2-dbus' 'python2-gconf' 'python2-keybinder2' 
'python2-notify' 'vte-legacy' 'python2-xdg' 'libutempter' 'pkgconfig' 'gtk2' 
'glib2')
makedepends=('git' 'intltool' 'gnome-common' 'python2-gconf')
conflicts=('guake')
provides=('guake')
source=("git://github.com/Guake/guake.git#branch=0.8.x")
sha512sums=('SKIP')
install=guake.install

pkgver() {
  cd "${srcdir}/${_appname%-git}"
  git describe --tags | sed 's,-,.,g'
}

build(){
  cd "${srcdir}/${_appname%-git}"
  PYTHON=$(which python2) ./autogen.sh --prefix=/usr --sysconfdir=/usr/share --disable-static
  make
}

package() {
  cd "${srcdir}/${_appname%-git}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
