# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=xbmpwall-git
pkgname=$pkgbase
pkgver=1.15
pkgrel=1

_gitname=xbmpwall
_gittag="v${pkgver}"

pkgdesc="X11 bitmap (.xbm) file manager for xsetroot. It shows a bitmap preview and allows you to place it as a wallpaper."


arch=('x86_64')

url='https://github.com/daltomi/xbmpwall'

license=('GPL3')

depends=('libxaw' 'xorg-xsetroot')

makedepends=('git' 'gcc' 'make' )

source=("git+${url}.git?signed#tag=${_gittag}"
        "xbmpwall.desktop"
        "xbmpwall.png"
        )

sha256sums=('SKIP'
            '952578d0e2b73f66e6070513ebeea827c4d48cb69b9bf7e95a90541d63b768b9'
            '6200014b0bad8ecdea1eb6eb242ebb0d42758634f93d065243034a42933cc343'
            )

validpgpkeys=('95BDE4BDE7F657BC298DD722EA8BDDF776B54DD1')

prepare() {
  cd $_gitname && git submodule update --init
}

build() {
  cd $_gitname &&  make release
}

package() {
  install -Dm755 "$_gitname/xbmpwall" "$pkgdir/usr/bin/xbmpwall"
  install -Dt "$pkgdir/usr/share/applications" -m644 "xbmpwall.desktop" 
  install -Dt "$pkgdir/usr/share/pixmaps" -m644 "xbmpwall.png"
  install -m755 -d "$pkgdir/usr/share/xbmpwall"
  install -Dt "$pkgdir/usr/share/xbmpwall/bitmaps/bw-bgnd" -m644 "$srcdir/$_gitname/bitmap-walls/bw-bgnd/"*.xbm
  install -Dt "$pkgdir/usr/share/xbmpwall/bitmaps/patterns" -m644 "$srcdir/$_gitname/bitmap-walls/patterns/"*.xbm
}
