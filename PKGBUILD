# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=xbmpwall-git
pkgname=$pkgbase
pkgver=1.2
pkgrel=1

_gitname=xbmpwall
_gittag="v${pkgver}"

pkgdesc="X11 bitmaps file manager (.xbm) for xsetroot"

arch=('x86_64')

url='https://github.com/daltomi/xbmpwall'

license=('GPL3')

depends=('libxaw' 'xorg-xsetroot')

makedepends=('git' 'gcc' 'make' )

source=("git+${url}.git?signed#tag=${_gittag}"
        "git+https://github.com/daltomi/bitmap-walls.git"
        "xbmpwall.desktop"
        )

sha256sums=('SKIP'
            'SKIP' 
            '0a8290dc7866b38c0b893b287b3487724d1c4126972a11e4e74f7e310122bdb8'
            )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')


build() {
  cd $_gitname &&  make release
}

package() {
  install -Dm755 "$_gitname/xbmpwall" "$pkgdir/usr/bin/xbmpwall"
  install -Dt "$pkgdir/usr/share/applications" -m644 "xbmpwall.desktop" 
  install -m755 -d "$pkgdir/usr/share/xbmpwall"
  install -Dt "$pkgdir/usr/share/xbmpwall/bitmaps/bw-bgnd" -m644 "$srcdir/bitmap-walls/bw-bgnd/"*.xbm
  install -Dt "$pkgdir/usr/share/xbmpwall/bitmaps/patterns" -m644 "$srcdir/bitmap-walls/patterns/"*.xbm
}
