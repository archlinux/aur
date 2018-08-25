# Maintainer: Ainola
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.4.1.10
pkgrel=1
pkgdesc='A development tool that is primarily used to create graphical adventure games'
arch=('i686' 'x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
depends=('allegro4' 'dumb-a4' 'libogg' 'libtheora' 'libvorbis')
makedepends=('wxgtk')
optdepends=('wine: for installing and configuring the game')
source=("https://github.com/adventuregamestudio/ags/archive/v.${pkgver}.tar.gz")
sha256sums=('7dd75df2131333f1b6885c89db275e0dee3f7b55d3d9c4e8afae612c94aca4e2')

prepare() {
  # Copious use of auto_ptr spams the compilation output. Until they're
  # replaced, just suppress the message.
  sed -i 's/-Wfatal-errors/-Wfatal-errors\ -Wno-deprecated-declarations/' \
    "ags-v.$pkgver/Engine/Makefile-defs.linux"
}

build() {
  cd "$srcdir/ags-v.${pkgver}"
  make -C Engine
}

package() {
  install -Dm755 "$srcdir/ags-v.${pkgver}/Engine/ags" \
                 "$pkgdir/usr/bin/ags"
  install -Dm644 "$srcdir/ags-v.${pkgver}/License.txt" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
