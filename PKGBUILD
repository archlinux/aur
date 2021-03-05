# Maintainer: Erik Bender <erik.bender@develerik.dev>

_pkgname=git-credential-1password
_orga=develerik
_gourl=github.com/$_orga/$_pkgname

pkgname="${_pkgname}"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Git credential.helper using 1Password for storage"
arch=('x86_64')
url="https://$_gourl"
license=('ISC')
makedepends=('git' 'go>=1.16' 'make')
depends=('git' '1password-cli')
provides=('git-credential-1password')
conflicts=("$_pkgname-dev-git" "$_pkgname-bin" "$_pkgname-git")
source=("git+https://$_gourl.git#tag=v1.0.0")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  VERSION=$pkgver make credential-helper
}

package() {
  cd ${srcdir}/${_pkgname}/bin
  install -DT -m0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
