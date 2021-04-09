pkgname=sublime-text-4-dev
pkgver=4.4102
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - dev build"
arch=('x86_64' 'aarch64')
url="http://www.sublimetext.com/"
license=('custom')
depends=('libpng' 'gtk3')
conflicts=('sublime-text')
optdepends=('gksu: sudo-save support')
install=sublime-text.install
source_x86_64=(
  "sublime-text.install"
  "sublime_text.desktop"
  "https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=(
  "sublime-text.install"
  "sublime_text.desktop"
  "https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")
sha256sums_x86_64=('388d1fe620727bd3e6bdda7b60150734616d8ba86ef1001478d0a41d1718c018'
                   'a400ae041bd8b3ed08bf04129e1d7ddc9df9edf5610532bd7b321a43e28c7ca9'
                   '29720b9083b379f247f2481d43a49b14f77910ed17e268c873051da5408279f5')
sha256sums_aarch64=('388d1fe620727bd3e6bdda7b60150734616d8ba86ef1001478d0a41d1718c018'
                    'a400ae041bd8b3ed08bf04129e1d7ddc9df9edf5610532bd7b321a43e28c7ca9'
                    '78416789fada4ebb84864abdfeda752b2a419a742432f0173f4d3ada9a037502')

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
