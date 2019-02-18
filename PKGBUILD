# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-brightness-control-applet
pkgver=0.2.1
pkgrel=2
pkgdesc="Brightness control applet for budgie desktop"
arch=('i686' 'x86_64')
url='https://github.com/ilgarmehmetali/budgie-brightness-control-applet'
license=('GPL2')
depends=('budgie-desktop' 'gnome-settings-daemon' 'libpeas')
makedepends=('fakeroot' 'gobject-introspection' 'meson' 'ninja' 'vala')

source=("https://github.com/ilgarmehmetali/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ab73f0aeb1ee34956c056ed0f13866dbbd4efeacc7d38650c68bbe627c95e4cb0e8033b82acf0d57742fa0f7a766dab458d8969994cdbed8e83fb30b63b90124')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}
