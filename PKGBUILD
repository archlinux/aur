# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Devin Cofer <ranguvar@archlinux.us>
# Contributor: Cainã Costa <sryche@archlinux-br.org>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

pkgname=fluxbox-git
pkgdesc="Lightweight stacking WM with tabbing, dockapps, etc."
pkgver=1.3.7.16.g69d1333
pkgrel=1
arch=(i686 x86_64)
url=http://www.fluxbox.org/
license=(MIT)
depends=(fribidi imlib2 libxft libxinerama libxpm libxrandr)
makedepends=(git)
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::git://git.fluxbox.org/${pkgname%-*}.git
    $pkgname.desktop)
sha256sums=('SKIP'
    '32ed3d444c938a3778520a641d5e0196a0fdf2984390d69a6546f8b86805c841')
sha512sums=('SKIP'
    '4c46bb22745849982b2e1ea02cc84f77bf81eeac827b10574eabcb5f2375805fe8b204a58aed15555b2477b1b9cc3f9e0aa4575a92ad9315495735a8e7ba40d1')

pkgver() {
    cd $pkgname/
    git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr --enable-xft --enable-xinerama --enable-imlib2 --enable-nls
    make
}

package() {
    cd $pkgname/
    make DESTDIR="$pkgdir" install
    install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/xsessions/${pkgname%-*}.desktop
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
