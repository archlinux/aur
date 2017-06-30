# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=sublime-text-nightly
pkgver=3.3140
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - nightly build (available to registered users only)"
arch=('i686' 'x86_64')
url="http://www.sublimetext.com/3dev"
license=('custom')
depends=('libpng' 'gtk2')
optdepends=('gksu: sudo-save support')
conflicts=('sublime-text-dev')
provides=('sublime-text-dev')
install=${pkgname}.install

source=('sublime_text_3.desktop')
source_i686=("https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x32.tar.bz2")
source_x86_64=("https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2")

sha256sums=('3125f8a8db79b4d853a26b0be364ec69a26f3c8e97467ceab09c1b653060f03b')
sha256sums_i686=('ad1c1fe8bcb67e42945c63510eac2d6f0d33c588ec7797ba9ddb64c29c38f915')
sha256sums_x86_64=('deb717d6bf1e57fb1a12944d09053d5998c02ec947e3b2871f88ce23314f2b0d')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "sublime_text_3" "${pkgdir}/opt/sublime_text_3"

  for res in 128x128 16x16 256x256 32x32 48x48; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    ln -s "/opt/sublime_text_3/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "sublime_text_3.desktop" "${pkgdir}/usr/share/applications/sublime_text_3.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/sublime_text_3/sublime_text" "${pkgdir}/usr/bin/subl3"
}
