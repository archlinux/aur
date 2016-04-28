# Maintainer: Gokcehan Kara <gokcehankara@gmail.com>

pkgname=cs2-git
pkgver=r1.6ba8344
pkgrel=1
pkgdesc="Second version of scaling algorithm for minimum-cost flow problems"
arch=('any')
url="http://www.avglab.com/andrew/soft.html"
license=('custom')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz") # TODO
source=("${pkgname}::git+https://github.com/iveney/cs2")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    sed -i 's/^#CFLAGS/CFLAGS/' makefile
    make
}

check() {
    cd "$pkgname"
    ./cs2 < sample.inp
}

package() {
    cd "$pkgname"
    install -D cs2 ${pkgdir}/usr/bin/cs2
    install -D sample.inp ${pkgdir}/usr/share/${pkgname}/sample.inp
    install -D COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/COPYRIGHT
}
