# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: shyokou <shyokou at gmail dot com>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
pkgname=obfs4-git
_gitname=obfs4
pkgver=130.69ffcc3
pkgrel=1
pkgdesc='The obfourscator - a pluggable transport proxy written in Go'
arch=('i686' 'x86_64')
url='https://gitweb.torproject.org/pluggable-transports/obfs4.git/'
license=('BSD')
conflicts=('obfs4proxy')
provides=('obfs4proxy')
makedepends=('git' 'go')
optdepends=('tor: you need tor to use this package')
source=('git+https://git.torproject.org/pluggable-transports/obfs4.git')
sha256sums=('SKIP')
_gourl=git.torproject.org/pluggable-transports/obfs4.git/obfs4proxy

pkgver()	{
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build()	{
  cd "${srcdir}/${_gitname}/obfs4proxy"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

package()	{
  cd "$srcdir"
  install -Dm0755 bin/obfs4proxy "${pkgdir}/usr/bin/obfs4proxy"
  install -Dm0644 ${_gitname}/doc/obfs4proxy.1 "${pkgdir}/usr/share/man/man1/obfs4proxy.1"
  install -Dm0644 ${_gitname}/ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm0644 ${_gitname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

## vim:set ts=2 sw=2 et:
