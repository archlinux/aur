# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=vala-panel-appmenu

pkgname=budgie-vala-panel-appmenu-applet
pkgver=0.6.94
pkgrel=1
pkgdesc="Vala Panel Application Menu for Budgie Desktop"
url='https://github.com/rilian-la-te/vala-panel-appmenu'
arch=('i686' 'x86_64')
license=('LGPL3')
depends=("appmenu-gtk-module=${pkgver}" 'budgie-desktop' "vala-panel-appmenu-common=${pkgver}")
optdepends=('appmenu-qt4: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
makedepends=('bamf>=0.5.0' 'cmake' 'gobject-introspection' 'gtk3' 'libwnck3' 'vala')
conflicts=('vala-panel-appmenu-budgie-git')

source=("https://github.com/rilian-la-te/vala-panel-appmenu/releases/download/${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha512sums=('9ba216b2760bd8f7999c0731e80f231af67d30fd2d44f3a906d2dde0784683bb3c348556144b2e18166d0b38d3b4583ca4dd9655463b0ded6e1b5f1a248af5f7')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  cmake ./ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DENABLE_APPMENU_GTK_MODULE=OFF \
    -DENABLE_REGISTRAR=OFF \
    -DENABLE_JAYATANA=OFF \
    -DENABLE_MATE=OFF \
    -DENABLE_XFCE=OFF \
    -DENABLE_VALAPANEL=OFF \
    -DENABLE_BUDGIE=ON

  make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share"
}
