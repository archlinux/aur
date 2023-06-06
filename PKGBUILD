pkgname=relcs-git
pkgver=1.0_r5619.33abd1b4
pkgrel=1
pkgdesc="Grand Theft Auto: LCS reverse engineered"
arch=(x86_64 aarch64)
url=https://github.com/halpz/re3
license=(custom:none)
depends=(librw-git openal mpg123)
makedepends=(cmake)
install=relcs.install
source=(
        git+https://github.com/halpz/re3.git#branch=lcs
        reLCS.desktop
        reLCS.svg)
md5sums=(
        SKIP
        SKIP
        SKIP)
pkgver(){
        cd re3
        echo 1.0_r`git rev-list --count HEAD`.`git rev-parse --short HEAD`
}
build(){
        cd re3
        cmake -DRELCS_VENDORED_LIBRW= .
        make
}
package(){
        cd re3
        install src/reLCS -Dt "$pkgdir"/usr/bin
        install ../reLCS.svg -Dt "$pkgdir"/usr/share/pixmaps
        install ../reLCS.desktop -Dt "$pkgdir"/usr/share/applications
        cp -r gamefiles "$pkgdir"/usr/share/reLCS
}
