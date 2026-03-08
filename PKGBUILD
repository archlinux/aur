# Maintainer: vcpd1 <https://github.com/vcpd1>

pkgname=voxcii-git
pkgver=r12.c7ff4ee
pkgrel=1
pkgdesc="Terminal-based ASCII 3D model viewer written in C++"
arch=('x86_64')
url="https://github.com/ashish0kumar/voxcii"
license=('MIT')
depends=('ncurses' 'glibc')
makedepends=('gcc' 'make' 'git')
provides=('voxcii')
conflicts=('voxcii')
source=("$pkgname::git+https://github.com/ashish0kumar/voxcii.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make LDFLAGS="$LDFLAGS"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 voxcii "$pkgdir/usr/bin/voxcii"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/$pkgname/models"
    install -Dm644 models/* "$pkgdir/usr/share/$pkgname/models/" 2>/dev/null || true
}
