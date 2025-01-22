# Maintainer: Francesco Pantano <fmount9@autistici.org>
# Contributor: fmount

pkgname=('c_otp')
_pkgname="c_otp"
packager="fmount"
pkgver=v1.2
pkgrel=2
bindir=usr/bin
pkgdesc="HOTP / TOTP pure C implementation"
url="htps://github.com/fmount/${pkgname}.git"
arch=('i686' 'x86_64')
license=('MIT')
depends=('openssl')
source=("git+https://github.com/fmount/${pkgname}.git#tag=${pkgver}")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname || exit -1
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd "$_pkgname" || exit -1
}

build() {
  echo "Start building $_pkgname"
  cd "${srcdir}/$_pkgname" || exit -1
  echo -e "c_otp: $pkgver" > PKG-INFO
  make
}

package() {
  cd "${srcdir}"/$_pkgname/$bindir || exit -1
  echo "Copy ${srcdir}/$_pkgname/$bindir/$_pkgname $bindir"
  install -Dm755 ${srcdir}/$_pkgname/$bindir/$_pkgname "$pkgdir/$bindir/$_pkgname"
  install -m644 -D ${srcdir}/$_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
