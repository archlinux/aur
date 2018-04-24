# Maintainer: rilian-la-te <ria.freelander@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=appmenu-gtk-module
pkgver=0.6.94
pkgrel=1
pkgdesc="Application Menu GTK+ Module"
depends=('gtk3' 'gtk2')
makedepends=('cmake' 'gtk3' 'gtk2')
conflicts=('unity-gtk-module' 'appmenu-gtk-module-git')
url="https://github.com/rilian-la-te/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("https://github.com/rilian-la-te/vala-panel-appmenu/releases/download/${pkgver}/appmenu-gtk-module.tar.xz"
        80appmenu-gtk-module)
sha256sums=('97a5ec89688be1a88470b44e829c198b200678b75c969f8bc4532c7db18575ee'
            '4c006c4ea7b8556070ad6d35529d3a9e23da8033429e34d1824c25942d969fbc')

build() {
  cd "${srcdir}/${pkgname}"
  cmake ./ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755  "${srcdir}/80appmenu-gtk-module" "${pkgdir}/etc/X11/xinit/xinitrc.d/"
}
