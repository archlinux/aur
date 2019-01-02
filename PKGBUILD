# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=xbmpwall-git
pkgname=$pkgbase
pkgver=1.5
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
        "xbmpwall.png"
        )

sha256sums=('SKIP'
            'SKIP' 
            '952578d0e2b73f66e6070513ebeea827c4d48cb69b9bf7e95a90541d63b768b9'
            '6200014b0bad8ecdea1eb6eb242ebb0d42758634f93d065243034a42933cc343'
            )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')


build() {
  cd $_gitname &&  make release
}

package() {
  install -Dm755 "$_gitname/xbmpwall" "$pkgdir/usr/bin/xbmpwall"
  install -Dt "$pkgdir/usr/share/applications" -m644 "xbmpwall.desktop" 
  install -Dt "$pkgdir/usr/share/pixmaps" -m644 "xbmpwall.png"
  install -m755 -d "$pkgdir/usr/share/xbmpwall"
  install -Dt "$pkgdir/usr/share/xbmpwall/bitmaps/bw-bgnd" -m644 "$srcdir/bitmap-walls/bw-bgnd/"*.xbm
  install -Dt "$pkgdir/usr/share/xbmpwall/bitmaps/patterns" -m644 "$srcdir/bitmap-walls/patterns/"*.xbm
}
