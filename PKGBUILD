# Maintainer: Jasper Young <jasper.c.young@gmail.com>

_pkgname=jasper-i3blocks-blocklets
pkgname="$_pkgname-git"
pkgver=r76.c0dfcc9
pkgrel=1
epoch=2
pkgdesc="Jasper's blocklets for i3blocks"
arch=('x86_64')
url="https://github.com/jasper1378/$_pkgname"
license=('MIT')
groups=('i3')
depends=('pulseaudio')
makedepends=('git')
#checkdepends=()
#optdepends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("git+$url.git")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

#prepare() {
#}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    ./build_all.sh
}

#check() {
#}

package() {
    cd "$srcdir/$_pkgname"

    install -v -Dm755 bin/* -t "$pkgdir/usr/lib/$pkgname/"

    install -v -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -v -dm755 "$pkgdir/usr/share/doc/$pkgname/"
    cp -ar doc/* "$pkgdir/usr/share/doc/$pkgname/"
    find "$pkgdir/usr/share/doc/$pkgname/" -type f -exec chmod 644 {} \;
}
