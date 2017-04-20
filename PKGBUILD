# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-annex-bin

pkgname=stund
pkgver=0.97
pkgrel=3
pkgdesc="STUN Server and Client"
url="http://downloads.sourceforge.net/project/stun/stun/"
source=("http://downloads.sourceforge.net/project/stun/stun/${pkgver}/${pkgname}-${pkgver}.tgz"
        "fix_non_i386.patch")
makedepends=()
optdepends=()
conflicts=(libnice)
arch=('x86_64' 'i686')
license=('GPL2')
sha256sums=('83e1bf9c21399244c5e8ad19789121a3537399d6523a887a5abc6187adcdb1d7'
            '8c09a0acc8797bf8060ed84ca4e0d6ca242447ea8cbee6c28904a7056773030d')

package() {
    cd "$srcdir/$pkgname"

    if [ `uname -m` = 'x86_64' ]; then
        patch < $srcdir/fix_non_i386.patch
    fi

	make all || return 1

	mkdir -p $pkgdir/usr/bin

	cp server $pkgdir/usr/bin/stund || return 1
	cp client $pkgdir/usr/bin/stunc || return 1
}
