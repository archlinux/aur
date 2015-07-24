# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
pkgname=obfs4-git
pkgver=130.69ffcc3
pkgrel=1
pkgdesc="The obfourscator - tor project"
arch=('i686' 'x86_64')
url="https://gitweb.torproject.org/pluggable-transports/obfs4.git/"
license=('custom')
depends=()
makedepends=('go' 'git')
source=('git+https://git.torproject.org/pluggable-transports/obfs4.git')

sha1sums=('SKIP')

_gitname=obfs4

pkgver() {
        cd "${srcdir}/${_gitname}"
        echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p ${srcdir}/src/${_gitname}
        cd "${srcdir}/${_gitname}"
	git --work-tree=${srcdir}/src/${_gitname} checkout -f master
	cd ${srcdir}/src/${_gitname}/obfs4proxy
	GOPATH=${srcdir} go get -v
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/obfs4proxy $pkgdir/usr/bin/obfs4proxy
}
