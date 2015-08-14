# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=pbpst-git
pkgver=0.r153.54b98b7
pkgrel=1

pkgdesc='A small tool to interact with pb instances'
url='https://github.com/HalosGhost/pbpst'
arch=('i686' 'x86_64')
license=('GPL2')

depends=('curl' 'jansson')
makedepends=('git' 'tup' 'clang' 'python-sphinx')

source=('git+https://github.com/HalosGhost/pbpst.git')
sha256sums=('SKIP')

pkgver () {
    cd pbpst
    printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git log -1 --pretty=format:%h)"
}

build () {
    cd pbpst
    tup upd
}

package () {
    cd pbpst
    install -Dm755 src/pbpst "$pkgdir"/usr/bin/pbpst
    install -Dm644 doc/pbpst.1 "${pkgdir}"/usr/share/man/man1/pbpst.1
    install -Dm644 doc/pbpst_db.5 "${pkgdir}"/usr/share/man/man5/pbpst_db.5
}
