# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Devin Cofer <ranguvar@archlinux.us>
# Contributor: Cainã Costa <sryche@archlinux-br.org>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

pkgname=fluxbox-git
pkgdesc="Lightweight stacking WM with tabbing, dockapps, etc."
pkgver=1.3.7.205.g1d19662c
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
md5sums=('SKIP'
         'c3cf99bfa58862724e0061e3881679aa')

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
