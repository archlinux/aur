# Maintainer: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname=ags
pkgver=3.3.5.5
pkgrel=1
pkgdesc="A development tool that is primarily used to create graphical adventure games"
arch=('i686' 'x86_64')
url="https://github.com/adventuregamestudio/ags"
license=('Artistic2.0')
depends=('allegro' 'dumb' 'libogg' 'libtheora' 'libvorbis')
makedepends=('wxgtk')
optdepends=('wine: for installing and configuring the game')
conflicts=('ags-git')
install=ags.install
source=("https://github.com/adventuregamestudio/ags/archive/v.${pkgver}.tar.gz")
sha256sums=('f125555ebaf6b93503d6b12735bbdb56acc73bc8c0bac397eb6cbd8c3e00a6b6')

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
