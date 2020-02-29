# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=smbmap
pkgname=python-smbmap-git
pkgver=v1.8.r0.g146a5d8
pkgrel=1
pkgdesc="SMBMap allows users to enumerate samba share drives across an entire domain"
arch=(any)
url="https://github.com/ShawnDEvans/smbmap"
license=('GPL3')
depends=('python' 'python-pyasn1' 'python-pycryptodome' 'python-impacket-git')
makedepends=('git')
provides=("${pkgname}")
conflicts=('smbmap' 'python2-smbmap-git')
source=('git+https://github.com/ShawnDEvans/smbmap.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgbase}"

  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -v -m755 "smbmap.py" "${pkgdir}/usr/bin/smbmap"
}
