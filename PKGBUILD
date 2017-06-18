# Maintainer: KeyboardFire <andy@keyboardfire.com>
pkgname=tm-git
pkgver=r6.68d8086
pkgrel=1
pkgdesc='a text-based stopwatch/countdown timer tool'
arch=('any')
url='http://github.com/KeyboardFire/tm'
license=('GPL')
depends=('glibc' 'libnotify')
makedepends=('git')
provides=('tm')
conflicts=('tm')
source=('tm::git+git://github.com/KeyboardFire/tm#branch=master')
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
