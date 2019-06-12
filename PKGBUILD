# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=dmenu-baitinq-git
_gitname=dmenu
pkgver=0
pkgrel=1
pkgdesc='Simple and extensible program runner (baitinq version)'
url='https://github.com/Baitinq/dmenu.git'
arch=('any')
license=('GPL')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
makedepends=('git')
conflicts=('dmenu')
provides=('dmenu')

# include config.h and any patches you want to have applied here
source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname"
    chmod -R 777 "$pkgdir/usr/share/$pkgname"
    chmod -R +x "$pkgdir/usr/share/$pkgname/scripts/"
}
