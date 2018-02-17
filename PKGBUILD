# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=udr
pkgver=0.9.4
pkgrel=2
pkgdesc="A UDT wrapper for rsync that improves throughput of large dataset transfers over long distances."
arch=('i686' 'x86_64')
url="https://github.com/LabAdvComp/UDR"
license=('apache-2.0' )
depends=('openssl' 'crypto++' 'rsync')
provides=('udr')
conflicts=('udr-git')
source=("https://github.com/LabAdvComp/UDR/archive/v${pkgver}.tar.gz")
md5sums=('74a7ebd384156be0fc3d9a08890e098b')

build() {
  cd "$srcdir/UDR-${_commit_hash}"*

  if test "$CARCH" == x86_64; then
    MACHINE=AMD64
  fi
  if test "$CARCH" == i686; then
    MACHINE=IA32
  fi
  unset LDFLAGS # LDFLAGS from /etc/makepkg.conf were causing build failure
  make -j1 -e arch=$MACHINE
}

package() {
  cd "$srcdir/UDR-${_commit_hash}"*
  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755  src/udr "${pkgdir}/usr/bin/"
  install -Dm644 "$srcdir/UDR-${_commit_hash}"*"/LICENSE.txt" -t "$pkgdir/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
