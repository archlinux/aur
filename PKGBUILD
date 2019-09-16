# Maintainer: coldbug <coldBug@e.mail.de>
pkgname=python2-smbmap-git
pkgver=1.0.5.r15.gb55fc05
pkgrel=1
pkgdesc="SMBMap allows users to enumerate samba share drives across an entire domain"
arch=(any)
url="https://github.com/ShawnDEvans/smbmap"
license=('GPL3')
depends=('python2' 'python2-pyasn1' 'python2-pycryptodome' 'impacket')
makedepends=('git')
provides=("${pkgname}")
conflicts=("smbmap")
source=('smbmap::git+https://github.com/ShawnDEvans/smbmap.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/smbmap"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/smbmap"

    install -v -m755 -d "${pkgdir}/usr/bin"
    install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
    install -v -m755 "smbmap.py" "${pkgdir}/usr/bin/smbmap"
}
