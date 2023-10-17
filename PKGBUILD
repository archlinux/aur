# Maintainer:

# The version number reflects changes only to ancillary files.
# The actual font files have not been changed since Nov 2003.

_fontname=luxi
_basename=font-bh-ttf
_pkgname="ttf-$_fontname"
pkgname="$_pkgname"
pkgver=1.0.4
pkgrel=1
pkgdesc='Luxi Truetype fonts'
url='https://gitlab.freedesktop.org/xorg/font/bh-ttf'
license=('custom')
arch=('any')

provides=("$_basename")
conflicts=("$_basename")

_dl_url="https://xorg.freedesktop.org/releases/individual/font"
_pkgsrc="$_basename-$pkgver"
_pkgext="tar.xz"
source=(
  "$_dl_url/$_pkgsrc.$_pkgext"{,.sig}
)
sha256sums=(
  '85a5f90d00c48c2b06fd125ea8adbc8b8ee97429e3075081c8710926efec3a56'
  'SKIP'
)

validpgpkeys=(
  4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E  # Alan Coopersmith <alan.coopersmith@oracle.com>
)

package() {
  # not using upstream `Makefile` because it fails with paths containing spaces
  install -Dm644 "$srcdir/$_pkgsrc"/*.ttf \
    -t "$pkgdir/usr/share/fonts/$pkgname"

  install -Dm644 "$srcdir/$_pkgsrc/42-luxi-mono.conf" \
    -t "$pkgdir/usr/share/fontconfig/conf.avail"

  mkdir -p "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s "../conf.avail/42-luxi-mono.conf" \
    "$pkgdir/usr/share/fontconfig/conf.default/"

  install -Dm644 "$srcdir/$_pkgsrc/COPYING" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
