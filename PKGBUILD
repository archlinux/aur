# Maintainer: Grey Christoforo <grey@christoforo.net>

pkgname=udr-git
pkgver=v0.9.4.r11.g7885528
pkgrel=1
pkgdesc="A UDT wrapper for rsync that improves throughput of large dataset transfers over long distances."
arch=('i686' 'x86_64')
url="https://github.com/LabAdvComp/UDR"
license=('apache-2.0' )
makedepends=('git')
groups=()
depends=('openssl')
makedepends=('git')
provides=('udr')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git://github.com/LabAdvComp/UDR')
md5sums=('SKIP')
noextract=()

pkgver() {
  cd UDR
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/UDR"

  if test "$CARCH" == x86_64; then
    buildarch="amd64"
  fi
  if test "$CARCH" == i686; then
    buildarch="ia32"
  fi
  make os=LINUX arch=$buildarch
}

package() {
  cd "$srcdir/UDR"
  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755  src/udr ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
