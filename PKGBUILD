# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-gnome"
pkgver=2.0.1
pkgrel=1
pkgdesc="GNOME (Mutter) portal for wallpiper"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('wallpiper' 'mutter' 'gobject-introspection' 'gnome-shell' 'mesa' 'libdrm' 'libxrandr' 'libx11')
makedepends=('git' 'mutter' 'gobject-introspection' 'mesa' 'libdrm' 'libxrandr' 'libx11')
install="wallpiper-gnome.install"
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make build-gnome
}

package() {
    cd "$srcdir/$pkgname"

    make -C programs/wallpiper-portal-gnome/native install DESTDIR="$pkgdir" PREFIX=/usr

    local extdir="$pkgdir/usr/share/gnome-shell/extensions/wallpiper-gnome@wallpiper.dev"
    install -d "$extdir"
    cp -r programs/wallpiper-portal-gnome/extension/. "$extdir/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
