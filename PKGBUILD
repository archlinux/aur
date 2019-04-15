# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.1.0
pkgrel=1
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libxss" "libnotify")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('a550a96f6b47f7686a0cb55fbab4b2e672edb6376266670c6d151cb4e8d4e10882043c718c8f83aa4be61f28ca5cc4a31106574bba63f6fbb2f0f7d99c40b14f')

build(){
    cd "$pkgname-v$pkgver"
    make build #buildmode PIE and -race are not compatible. Dropping PIE
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
