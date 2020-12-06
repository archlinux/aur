# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=budgie-desktop-view-git
pkgver=v1.0.2.r0.g39641f2
pkgrel=1
pkgdesc="The official Budgie desktop icons application / implementation -- latest git"
arch=('x86_64')
url="https://solus-project.com/budgie"
license=('APACHE')
depends=(
budgie-desktop
)
makedepends=(
meson
git
gobject-introspection
intltool
vala
gtk-doc
)
source=("git+https://github.com/getsolus/budgie-desktop-view.git")
md5sums=('SKIP')

pkgver() {
  cd budgie-desktop-view
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd budgie-desktop-view
  meson --prefix=/usr --sysconfdir=/etc build
}

build() {
  cd budgie-desktop-view
  ninja -C build
}

package() {
  cd budgie-desktop-view
  DESTDIR="${pkgdir}" ninja -C build install
}

