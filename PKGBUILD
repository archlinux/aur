# Maintainer: Callum Parsey <neoninteger@protonmail.com>

pkgname=amethyst
pkgver=3.2
pkgrel=2
pkgdesc='A lightweight source code editor with tree-view navigation'
arch=('x86_64')
url='https://byuu.org'
license=('ISC' 'GPL3')
depends=('gtksourceview2')
source=('https://files.byuu.org/releases/amethyst_v3r2.tar.xz'
        'amethyst-release.patch'
        'LICENSE')
sha256sums=('11dee5ed719d41f5e776eeae09d20a52608d773177adabe1bdecc4b4644a6116'
            'a4f36370a32ab4624b8d58f5058f3c10578170cbdb8ebb5c100d348697e472a0'
            '9af7b9ec6c5c74a0421acb9e2755fe5b92fcce28a3c3a0300ecbe7002269b7f6')
backup=('usr/share/amethyst/mimetypes.bml'
        'usr/share/amethyst/settings.bml')

prepare() {
  patch -Np1 -i amethyst-release.patch
}

build() {
  cd amethyst
  make
}

package() {
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/amethyst
  cd amethyst
  install -Dm 755 out/amethyst -t "${pkgdir}"/usr/bin
  install -Dm 644 data/amethyst.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 data/amethyst.svg -t "${pkgdir}"/usr/share/icons
  install -Dm 644 data/mimetypes.bml -t "${pkgdir}"/usr/share/amethyst
  install -Dm 644 data/settings.bml -t "${pkgdir}"/usr/share/amethyst
}
