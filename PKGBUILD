# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=sublime-text-4
pkgver=4.4143
pkgrel=2
pkgdesc='Sophisticated text editor for code, html and prose - stable build'
arch=('x86_64' 'aarch64')
url='https://www.sublimetext.com/download'
license=('custom')
depends=('libpng' 'gtk3')
conflicts=('sublime-text')
provides=('sublime-text')

source_x86_64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")

sha256sums_x86_64=('7de862c38d19367414117110328dded754ac709fed54c8cc5cb0737c894c073c')
sha256sums_aarch64=('e33a4d1d51073bdf2f1dc5936ea9b096b078f87230a10a23790beaee702a4a93')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r 'sublime_text' "${pkgdir}/opt/sublime_text"

  for res in 128x128 16x16 256x256 32x32 48x48; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    ln -s "/opt/sublime_text/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
  done

  sed -i 's#/opt/sublime_text/sublime_text#/usr/bin/subl#g' 'sublime_text/sublime_text.desktop'

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 'sublime_text/sublime_text.desktop' "${pkgdir}/usr/share/applications/sublime_text.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/sublime_text/sublime_text' "${pkgdir}/usr/bin/subl"
}
