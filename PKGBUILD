# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-caffeine-applet
pkgver=0.1.5
pkgrel=1
pkgdesc="Simple applet to prevent screen dimming on long idle time for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/yursan9/budgie-caffeine-applet"
depends=('budgie-desktop' 'libnotify' 'python' 'python-gobject')
makedepends=('gobject-introspection' 'meson' 'ninja')

source=("https://github.com/yursan9/budgie-caffeine-applet/archive/v${pkgver}.tar.gz")
sha512sums=('a6ddff81a745439828be7f88d081ba70cb714508c83fb8caef76df6be9bc45a914374a58382eb271322e14ba3b21543902972db285413c5dc24971adf691870d')

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
