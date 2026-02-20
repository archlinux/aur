# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgbase=sshexec
pkgname=($pkgbase $pkgbase-sshcd)
pkgver=1.2.1
pkgrel=1
pkgdesc="SSH wrapper that makes it easy to run commands directly in the SSH command"
arch=('x86_64')
url="https://codeberg.org/maandree/sshexec"
license=('custom:ISC')
depends=()
source=(sshexec-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(91d4ea005e02362d6ca05369288d147e7875176722a730fab34a3d2f98d2208b)

build() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package_sshexec() {
  depends=(openssh)

  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  rm -- "${pkgdir}/usr/bin/sshcd"
  rm -- "${pkgdir}/usr/share/man/man1/sshcd.1"
}

package_sshexec-sshcd() {
  pkgdesc="SSH wrapper that lets the user run an interactive shell in a specified directory"
  depends=(sshexec)
  conflicts=(sshcd)
  provides=(sshcd)

  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  rm -- "${pkgdir}/usr/bin/sshexec"
  rm -- "${pkgdir}/usr/share/man/man1/sshexec.1"
}
