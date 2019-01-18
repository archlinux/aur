# Maintainer: axionl <axionl@aosc.io>
pkgname=minieap-gzhu-git
pkgver=r147.445e77e
pkgrel=1
pkgdesc="An open source client for ruijie on gzhu."
arch=('x86_64')
url="https://github.com/GZHU-Dress/minieap"
license=('GPL3')
makedepends=('git' 'make' 'glibc')

source=($pkgname::git+https://github.com/GZHU-Dress/minieap.git
        'minieap-gzhu.service')

md5sums=('SKIP'
         '89b995651402c632b0bd3d4fba1065c2')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    dir="$srcdir/$pkgname/"
    cd $dir
    make 
}
package() {
    dir="$srcdir/$pkgname/"
    install -Dm644 minieap-gzhu.service ${pkgdir}/usr/lib/systemd/system/minieap-gzhu.service
    install -Dm755 $dir/minieap ${pkgdir}/usr/bin/minieap-gzhu
    echo "After install you need to add your info to systemd service by '$ sudo nano /usr/lib/systemd/system/minieap-gzhu.service'"
}
