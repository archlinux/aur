# Maintainer: Florian Stecker <oss@florianstecker.net>
# Contributor: Sagnik Mandal <criticic>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: earnestly

pkgname=llpp
pkgver=42
pkgrel=1
pkgdesc='opengl accelerated pdf viewer based on mupdf'
arch=('x86_64')
url=https://github.com/criticic/llpp
_commit=dbf07cf23e006d4bcb23469b41da50697c1907b8
license=('GPL3')
depends=('freetype2' 'gumbo-parser' 'jbig2dec' 'libgl' 'libjpeg' 'openjpeg2' 'libmupdf')
makedepends=('asciidoc' 'git' 'ocaml' 'ocaml-lablgl')
optdepends=('djvulibre: for llppac djvu conversion'
            'ghostscript: for llppac ps, dvi, and djvu conversion'
            'imagemagick: for llppac image conversion'
            'inotify-tools: for the llpp.inotify autoreload wrapper'
            'librsvg: for llppac svg conversion'
            'unoconv: for llppac office conversion')
options=('!strip' '!debug')
source=("git+$url#commit=$_commit")
b2sums=('SKIP')

build() {
  cd $pkgname
  bash ./build.bash build
  bash ./build.bash build doc
}

package() {
  cd $pkgname
  install -Dt "$pkgdir"/usr/bin build/llpp misc/llpp{.inotify,ac}
  install -Dm644 -t "$pkgdir"/usr/share/applications misc/llpp.desktop
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 build/doc/*.1
}
