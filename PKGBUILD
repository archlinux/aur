# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=scribe-bin
pkgver=0.3.50
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
sha256sums=('c0b35de0311e4d7d04555d3bf9ca1bd14184b4241143f56982ee6264135f24d0')

package() {
  bsdtar -xf "$srcdir/$_debfile" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -d "$pkgdir/usr/share/licenses"
  mv "$pkgdir/usr/share/doc/scribe" "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$pkgdir/usr/share/doc"
}
