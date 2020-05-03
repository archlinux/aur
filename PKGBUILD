# Maintainer: Callum Parsey <neoninteger@protonmail.com>

pkgname=amethyst
pkgver=3.3
pkgrel=1
pkgdesc='A lightweight source code editor with tree-view navigation'
arch=('x86_64')
url='https://byuu.org/projects/amethyst'
license=('ISC' 'GPL3')
depends=('gtksourceview2')
source=('https://byuu.org/files/releases/amethyst_v3r3.tar.xz'
        'amethyst-release.patch'
        'LICENSE')
sha256sums=('5445f658d9a0322c180801bbb710ae4e097d9594a2d2f2d5c1ac9e9794e1e833'
            '4c9fd1819f244317d8455dcb16cfa0047ed4815ea6ae6c441ff3b2a9f7a9c3ca'
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
