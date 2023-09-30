# Maintainer: Zhiya Luo <luozhiya@petalmail.com>
# Contributor: Hammer <topo20@protonmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=mogan
pkgver=1.1.5
_tagver=v${pkgver//_/-}
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url='https://github.com/XmacsLabs/mogan'
license=('GPL3')
depends=("qt5-base" "qt5-svg" "freetype2" "sqlite" "libpng" "libiconv" "zlib" "libjpeg" "curl" "texlive-core" "python" "libxext")
makedepends=("git" "xmake")
optdepends=(
  'gawk: Conversion of some files'
  'ghostscript: Rendering ps files'
  'imagemagick: Convert images'
  'aspell: Spell checking')
source=("${pkgname}::git+${url}.git#tag=${_tagver}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}"
  xrepo update-repo
  xmake config -m release --yes
  xmake build --yes --verbose --diagnosis --jobs=8 --all
}

package() {
  cd "${pkgname}"
  # running makepkg in fakeroot environment
  xmake install --root -o "${pkgdir}"/usr mogan_install 
}

# vim:set sw=2 sts=2 et:
