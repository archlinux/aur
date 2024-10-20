# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>
# Contributor: Mario Aichinger <aichingm /at/ gmail.com>
# Contributor: Florian Reimair <office /at/ florianreimair.at>

pkgname=guake-git
pkgver=3.10.16.gdf9fbbee
pkgrel=1
pkgdesc="Top-down terminal for Gnome using gtk3 and vte3"
arch=('any')
url="https://guake.github.io/"
license=('GPL-2.0-or-later')
depends=('libkeybinder3' 'libnotify' 'libutempter' 'libwnck3' 'python-cairo'
         'python-dbus' 'python-gobject' 'python-pbr' 'vte3' 'python-yaml')
makedepends=('git' 'python-pip' 'make')
conflicts=('guake')
provides=('guake')
source=("git+https://github.com/Guake/guake.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags | sed 's,-,.,g'
}

build(){
  cd "${srcdir}/${pkgname%-git}"
  make 
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  sed -i '/-m pip install -r requirements.txt/d' Makefile
  make DESTDIR="$pkgdir" PREFIX='/usr' COMPILE_SCHEMA=0 install
}

