# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-annex-bin

pkgname=stund
pkgver=0.97
pkgrel=1
pkgdesc="STUN Server and Client"
url="http://downloads.sourceforge.net/project/stun/stun/"
source=("http://iweb.dl.sourceforge.net/project/stun/stun/0.97/stund-0.97.tgz" "fix_non_i386.patch")
makedepends=()
optdepends=()
arch=('x86_64' 'i686')
license=('GPL2')
md5sums=('097fd27829e357c005afcafd51564bd1'
         'da4912d40ab4fb58c2800c2260bf3a5e')

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
