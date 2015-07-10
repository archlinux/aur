# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=sublime-text-nightly
pkgver=3.3095
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

sha256sums=('122c24a4746150c6f99d3482ca185353a3825b07dadfbfe7ce8361a59f93a8ff')
sha256sums_i686=('c9d32563dbca7172c34114df9a2a0a56e13b3e0233b73551b5dda21d1c484d50')
sha256sums_x86_64=('c623cc7a864af31ecd89cb3466c94a44c48a7d7aa148b82f39fadfc21f2c6d32')

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
