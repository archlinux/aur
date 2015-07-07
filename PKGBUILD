# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=sublime-text-nightly
pkgver=3.3094
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
source_x86_64=("http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2")
source_i686=("http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_${pkgver:2}_x32.tar.bz2")

md5sums=('3843bb9bba00e7817e3194ed99d2ff26')
md5sums_i686=('ab1e1c3366874d09ddeb95da916c8743')
md5sums_x86_64=('8c543ccf336b59949baa399402198be5')

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
