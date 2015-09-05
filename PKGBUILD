# Maintainer: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname=ags
pkgver=3.3.4.1
pkgrel=2
pkgdesc="A development tool that is primarily used to create graphical adventure games"
arch=('i686' 'x86_64')
url="https://github.com/adventuregamestudio/ags"
license=('Artistic2.0')
depends=('dumb' 'libtheora')
makedepends=('wxgtk')
optdepends=('wine: for installing and configuring the game')
install=ags.install
source=("https://github.com/adventuregamestudio/ags/archive/v.${pkgver}.tar.gz")
sha256sums=('ac4ea69bacf3c3f071e97a8489d5cd02921b2868eb9d4c49af138935e8c9b4ea')

prepare() {
  cd "$srcdir/ags-v.${pkgver}"
  sed -i 's/-Wfatal-errors\ //' Engine/Makefile-defs.linux
}

build() {
  cd "$srcdir/ags-v.${pkgver}"
  make -C Engine
}

package() {
  install -Dm755 "$srcdir/ags-v.${pkgver}/Engine/ags" "$pkgdir/usr/bin/ags"
  install -Dm644 "$srcdir/ags-v.${pkgver}/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
