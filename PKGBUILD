# Maintainer: mars <твой@email.com>
pkgname=easygamma-git
pkgver=r4.d17fad4
pkgrel=1
pkgdesc="Simple GTK3 GUI for gamma and brightness control on X11 via xrandr"
arch=('x86_64')
url="https://github.com/jahamars/EasyGamma"
license=('MIT')
depends=('gtkmm3' 'xorg-xrandr')
makedepends=('gcc' 'pkgconf' 'git')
provides=('easygamma')
conflicts=('easygamma')
source=("$pkgname::git+https://github.com/jahamars/EasyGamma.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    g++ main.cpp -o easygamma $(pkg-config gtkmm-3.0 --cflags --libs)
}

package() {
    cd "$pkgname"
    install -Dm755 easygamma "$pkgdir/usr/bin/easygamma"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
