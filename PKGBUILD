# Contributor: Hakan Erduman <hakan at erduman dot de>
# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: git

pkgname=xfce4-hamster-plugin-git
pkgver=1.14.r0.ga923422
pkgrel=1
pkgdesc="recreation of the gnome-shell hamster extension as a xfce4 panel plugin"
url="https://github.com/projecthamster/${pkgname%-git}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel' 'hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' 'git')
source=("${pkgname}::git+https://github.com/projecthamster/${pkgname%-git}")
sha256sums=('SKIP')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})


pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --enable-silent-rules -silent --with-icon_name=hamster-time-tracker
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
