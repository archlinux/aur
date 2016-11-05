# Maintainer: KeyboardFire <andy@keyboardfire.com>
pkgname=hxqz-git
pkgver=r3.0b6defd
pkgrel=1
pkgdesc='hex arithmetic quiz'
arch=('any')
url='http://github.com/KeyboardFire/hxqz'
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('hxqz')
conflicts=('hxqz')
source=('hxqz::git+git://github.com/KeyboardFire/hxqz#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
