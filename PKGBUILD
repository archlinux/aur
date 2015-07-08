# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=libpfring-git
_pkgname=PF_RING
pkgver=20150708
pkgrel=1
pkgdesc="library to interface with the PF_RING kernel module"
url="http://www.ntop.org"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('numactl' 'pfring-kmod-git')
makedepends=('linux-headers' 'make' 'binutils' 'flex' 'bison' 'git')
conflicts=('libpfring')
provides=('libpfring')
options=(staticlibs)
source=("git+https://github.com/ntop/PF_RING.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/${_pkgname}/userland/lib"
        ./configure --prefix=/usr --libdir=/usr/lib/libpfring --includedir=/usr/include/pfring
        make
}

package() {
        cd "${srcdir}/${_pkgname}/userland/lib"
        make DESTDIR="${pkgdir}" install

        install -d  ${pkgdir}/usr/share/doc/${pkgname}
        install -d  ${pkgdir}/usr/share/licenses/${pkgname}
        install -Dm644 ${srcdir}/${_pkgname}/userland/lib/COPYING $pkgdir/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 ${srcdir}/${_pkgname}/doc/PF_RING-UsersGuide.pages $pkgdir/usr/share/doc/${pkgname}/PF_RING-UsersGuide.pages
        install -Dm644 ${srcdir}/${_pkgname}/doc/UsersGuide.pdf $pkgdir/usr/share/doc/${pkgname}/UsersGuide.pdf
        install -Dm644 ${srcdir}/${_pkgname}/doc/UsersGuide_Russian.pdf $pkgdir/usr/share/doc/${pkgname}/UsersGuide_Russian.pdf 
        install -Dm644 ${srcdir}/${_pkgname}/ChangeLog $pkgdir/usr/share/doc/${pkgname}/ChangeLog
        install -Dm644 ${srcdir}/${_pkgname}/README $pkgdir/usr/share/doc/${pkgname}/README 
        install -Dm644 ${srcdir}/${_pkgname}/README.DNA_Libzero $pkgdir/usr/share/doc/${pkgname}/README.DNA_Libzero
        install -Dm644 ${srcdir}/${_pkgname}/README.FIRST $pkgdir/usr/share/doc/${pkgname}/README.FIRST
        install -Dm644 ${srcdir}/${_pkgname}/README.MIGRATE_DNA_to_ZC $pkgdir/usr/share/doc/${pkgname}/README.MIGRATE_DNA_to_ZC
        install -Dm644 ${srcdir}/${_pkgname}/README.ZC $pkgdir/usr/share/doc/${pkgname}/README.ZC
        install -Dm644 ${srcdir}/${_pkgname}/README.hugepages $pkgdir/usr/share/doc/${pkgname}/README.hugepages 
}
