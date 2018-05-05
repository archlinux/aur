# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-caffeine-applet
pkgver=0.1.5
pkgrel=2
pkgdesc="Simple applet to prevent screen dimming on long idle time for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/yursan9/budgie-caffeine-applet"
depends=('budgie-desktop' 'libnotify' 'python' 'python-gobject')
makedepends=('gettext' 'gobject-introspection' 'meson' 'ninja')

source=("https://github.com/yursan9/budgie-caffeine-applet/archive/v${pkgver}.tar.gz"
        zh_CN.po)
sha512sums=('a6ddff81a745439828be7f88d081ba70cb714508c83fb8caef76df6be9bc45a914374a58382eb271322e14ba3b21543902972db285413c5dc24971adf691870d'
            '0a85efe1306dc3a148197d5a1316aba98be2910427ebb2c63b05ef45e79b61c9428360036aa16db332c1606c80f79a163c1b19e82751fa25b7b0dc8690f004f0')

build() {
  cd "$srcdir"
  msgfmt -o zh_CN.mo zh_CN.po

  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install

  install -d "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES"
  install -D -m644 ../../zh_CN.mo "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/budgie-caffeine-applet.mo"
}
