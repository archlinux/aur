# Maintainer: Gabriel Laskar <gabriel at lse dot epita dot fr>
pkgname=oksh
pkgver=7.4
pkgrel=1
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('custom: Public Domain' 'ISC' 'BSD')
depends=('glibc' 'ncurses')
arch=('i686' 'x86_64')
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('be9a8d457bf373bd04618074c41b46f4edec2ba1c57a58be881d60eaa6628596')
backup=(etc/ksh.kshrc)
install=oksh.install

build() {
       cd "${pkgname}-${pkgver}"

       ./configure --prefix=/usr
       sed -n '/Copyright/,/PERFORMANCE/p' strtonum.c > ISC-LICENSE
       sed -n '/Copyright/,/SUCH DAMAGE./p' vis.c > BSD-LICENSE
       cat LEGAL > PUBLIC_DOMAIN-LICENSE
       make
}

package() {
       cd "${pkgname}-${pkgver}"

       make DESTDIR="${pkgdir}/" install

       install -Dm644 ksh.kshrc "${pkgdir}/etc/ksh.kshrc"
       install -Dm644 ISC-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/ISC-LICENSE"
       install -Dm644 BSD-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD-LICENSE"
       install -Dm644 PUBLIC_DOMAIN-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/PUBLIC_DOMAIN-LICENSE"
}

# vim:set ts=2 sw=2 et:
