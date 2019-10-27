# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=social-git
_pkgname=Social
pkgver=226
pkgrel=1
pkgdesc="A Mastodon and Pleroma application for GNOME"
arch=('x86_64')
depends=('glib2' 'gtk3' 'libhandy' 'gtksourceview4')
makedepends=('meson' 'vala')
conflicts=("social")
provides=("social")
url="https://gitlab.gnome.org/World/Social"
license=("GPL3")
source=("git+https://gitlab.gnome.org/World/Social.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson -Db_pie=false _build
    ninja -C _build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    #cd $srcdir/$_pkgname-$pkgver/_build
    DESTDIR="$pkgdir/" ninja -C _build install
}
