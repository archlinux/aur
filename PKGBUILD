# Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>

pkgname=guieditor-git
pkgver=2022.07.26.5c632de
pkgrel=1
pkgdesc='GUI editor for GNU Octave'
arch=(i686 x86_64)
url='https://gitlab.com/labinformatica/guieditor'
license=(GPL3)
depends=(qt5-base qt5-tools qt5-serialport)
source=(git+https://gitlab.com/labinformatica/guieditor.git 
        guiEditor.desktop)
sha1sums=('SKIP'
          'f598e8c009442788bbbd62b925ebd74b84968e2c')

pkgver() {
  cd "${srcdir}/guieditor"
  git log --pretty=format:"%ad.%h" --date=format:"%Y.%m.%d" -n 1
}

# prepare() {
#   echo 'prepare'
# }

build() {
  cd "${srcdir}/guieditor"
  PREFIX=/opt/guiEditor qmake guiEditorPrj.pro -recursive -config release
  make
}

package() {
  install -Dm755 "${srcdir}/guieditor/srcGuiEditor/guiEditor" "${pkgdir}/opt/guiEditor/guiEditor"
  install -Dm644 "${srcdir}/guieditor/srcGuiEditor/srcGuiEditor_en.qm" "${pkgdir}/opt/guiEditor/srcGuiEditor_en.qm"
  install -Dm644 "${srcdir}/guieditor/srcGuiEditor/srcGuiEditor_sp.qm" "${pkgdir}/opt/guiEditor/srcGuiEditor_sp.qm"
  install -Dm644 "${srcdir}/guieditor/iconos/guiEditor_icon.png" "${pkgdir}/usr/share/pixmaps/guieditor.png"
  install -Dm644 "${srcdir}/guiEditor.desktop" "${pkgdir}/usr/share/applications/guiEditor.desktop"
}
