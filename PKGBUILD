# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=v1.6.1.r0.g9d008ea
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('GPL v2.0')
makedepends=('rust' 'git')
source=("$pkgname::git+https://github.com/rolv-apneseth/$pkgname.git")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    cd "$pkgname"

    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$pkgname"

    make DESTDIR="$pkgdir/" build
}

package()
{
    cd "$pkgname"

    make DESTDIR="$pkgdir/" install
}
