# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>
# Contributor: Mario Aichinger <ichingm /at/ gmail.com>

pkgname=guake-git
pkgver=3.0.0.a5.20.gcef4bac
pkgrel=1
pkgdesc="Top-down terminal for Gnome"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Guake/guake"
license=('GPL')
depends=('python2-notify' 'vte3' 'python2-gconf' 'python2-dbus' 'python2-keybinder2' 'python2-xdg' 'libutempter' 'libkeybinder3' 'python-cairo')
makedepends=('git' 'python2-pipenv' 'gnome-common' 'make')
conflicts=('guake' 'guake-gtk2-git')
provides=('guake')
source=("git://github.com/Guake/guake.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags | sed 's,-,.,g'
}

build(){
  cd "${srcdir}/${pkgname%-git}"
  make dev
  make build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make install-system INSTALL_ROOT="$pkgdir/"
}
