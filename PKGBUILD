# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Sander Boom <sanderboom@gmail.com>
# Contributor: realitygaps <realitygaps at yahoo dot com>

pkgname=sublime-text-dev
pkgver=4.4115
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - dev build"
arch=('x86_64' 'aarch64')
url="https://www.sublimetext.com/dev"
license=('custom')
depends=('libpng' 'gtk3')
optdepends=('gksu: sudo-save support')
conflicts=('sublime-text')
provides=('sublime-text')
install=${pkgname}.install

source=('sublime_text.desktop')
source_x86_64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")

sha256sums=('e991aac5207655dadf69c6f74c194c80009fb9767d7710337f586908969aa9cf')
sha256sums_x86_64=('21cf824f89322c7d95185550a9215211d819f86f72d3ea6b8197410a0fe007d6')
sha256sums_aarch64=('e76db06de785e5b580ae87bfc2b02b4a231a83837baa5838ff26550148ea13d6')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "sublime_text" "${pkgdir}/opt/sublime_text"

  for res in 128x128 16x16 256x256 32x32 48x48; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    ln -s "/opt/sublime_text/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "sublime_text.desktop" "${pkgdir}/usr/share/applications/sublime_text.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/sublime_text/sublime_text" "${pkgdir}/usr/bin/subl"
}
