# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=v0.0.2.r0.g4068513
pkgrel=1
pkgdesc='A rust program which uses .desktop files to create a rofi game launcher'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('GPL v2.0')
makedepends=('rust' 'git')
source=("$pkgname::git+https://github.com/rolv-apneseth/$pkgname.git")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    cd "$pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$pkgname"
    cargo build --frozen --release
}

package()
{
    cd "$pkgname"

    # binary
    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

    # license
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
