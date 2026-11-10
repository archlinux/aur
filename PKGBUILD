# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=scribe-bin
pkgver=0.3.45
pkgrel=1
pkgdesc='A native GNOME Markdown editor that renders your document as you type (upstream binary)'
arch=('x86_64')
url='https://github.com/gnacho/scribe'
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'enchant'
  'gdk-pixbuf2'
  'glib2'
  'glibc>=2.34'
  'graphene'
  'gtk4>=4.14'
  'gtksourceview5>=5.10'
  'hicolor-icon-theme'
  'libadwaita>=1.5'
  'libgcc'
  'pango'
)
provides=("scribe=$pkgver")
conflicts=('scribe' 'scribe-git')
options=('!strip' '!debug')

_debrel=1
_debfile="scribe_${pkgver}-${_debrel}_amd64.deb"
source=("https://github.com/gnacho/scribe/releases/download/v${pkgver}/${_debfile}")
noextract=("$_debfile")
sha256sums=('823ba58239f5f3afd673c2cfdaf268f6b31a51354f17205a08c203d04343b715')

package() {
  bsdtar -xf "$srcdir/$_debfile" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -d "$pkgdir/usr/share/licenses"
  mv "$pkgdir/usr/share/doc/scribe" "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$pkgdir/usr/share/doc"
}
