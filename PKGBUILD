# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>

pkgname=guake-git
pkgver=0.7.2.30.g77ec69c
pkgrel=1
pkgdesc="Top-down terminal for Gnome"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Guake/guake"
license=('GPL')
depends=('python2' 'pygtk' 'vte' 'python2-notify' 'python2-dbus' 'python2-xdg' 'python2-keybinder2' 'pkgconfig' 'gtk2' 'glib2')
makedepends=('git' 'intltool' 'gnome-common')
conflicts=('guake')
provides=('guake')
source=("git://github.com/Guake/guake.git")
sha512sums=('SKIP')
install=guake.install

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags | sed 's,-,.,g'
}

build(){
  cd "${srcdir}/${pkgname%-git}"
  PYTHON=$(which python2) ./autogen.sh --prefix=/usr --sysconfdir=/usr/share --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
