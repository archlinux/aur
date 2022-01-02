# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: shyokou <shyokou at gmail dot com>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
pkgname=obfs4-git
_gitname=obfs4
pkgver=189.cbf3f3c
pkgrel=1
pkgdesc='The obfourscator - a pluggable transport proxy written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://gitweb.torproject.org/pluggable-transports/obfs4.git/'
license=('BSD')
conflicts=('obfs4proxy')
provides=('obfs4proxy')
makedepends=('git' 'go')
optdepends=('tor: you need tor to use this package')
source=('git+https://gitlab.com/yawning/obfs4.git')
sha256sums=('SKIP')

pkgver()	{
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build()	{
  cd "${srcdir}/${_gitname}"
  GOPATH="${srcdir}/go" go build -o obfs4proxy/obfs4proxy ./obfs4proxy
}

package()	{
  cd "${srcdir}/${_gitname}"
  install -Dm0755 obfs4proxy/obfs4proxy "${pkgdir}/usr/bin/obfs4proxy"
  install -Dm0644 doc/obfs4proxy.1 "${pkgdir}/usr/share/man/man1/obfs4proxy.1"
  install -Dm0644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

## vim:set ts=2 sw=2 et:
