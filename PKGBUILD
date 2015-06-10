# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

pkgname=cjdnsify
pkgver=20140717.r6.bc354af
pkgrel=1
pkgdesc="Limit network access of bind-compatible programs to the local cjdns network"
url="https://github.com/prurigro/${pkgname}"
license=('GPL')
depends=('bash' 'cjdns-git' 'force_bind')
makedepends=('git')
arch=('any')
backup=("etc/default/${pkgname}")

source=("git://github.com/prurigro/${pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $pkgname
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ${pkgname}.conf "${pkgdir}/etc/default/${pkgname}"
}
