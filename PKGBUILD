# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=stund
pkgver=0.97
pkgrel=5
pkgdesc='STUN Server and Client'
url='https://sourceforge.net/projects/stun/'
source=("https://downloads.sourceforge.net/project/stun/stun/$pkgver/$pkgname-$pkgver.tgz"
        'fix_non_i386.patch')
conflicts=('libnice')
arch=('x86_64')
license=('GPL2')
sha256sums=('83e1bf9c21399244c5e8ad19789121a3537399d6523a887a5abc6187adcdb1d7'
            '8c09a0acc8797bf8060ed84ca4e0d6ca242447ea8cbee6c28904a7056773030d')

prepare() {
    cd "$pkgname"
    patch < "$srcdir/fix_non_i386.patch"
}

build() {
    cd "$pkgname"
	make all
}

package() {
    cd "$pkgname"
	install -Ddm755 "$pkgdir/usr/bin"
	install -Dm0755 server "$pkgdir/usr/bin/stund"
	install -Dm0755 client "$pkgdir/usr/bin/stunc"
}
