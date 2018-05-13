# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-caffeine-applet
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple applet to prevent screen dimming on long idle time for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/yursan9/budgie-caffeine-applet"
depends=('budgie-desktop' 'libnotify' 'python' 'python-gobject')
makedepends=('gobject-introspection' 'meson' 'ninja')

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d795c6b5fc2c2e7f7f225e120543497da683a6dabd50124d2afac07b2bc0422d')

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
