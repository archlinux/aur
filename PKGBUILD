# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> with contributions from Andreas Schweitzer <sig11@gmx.net>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=qstat
pkgver=2.11
pkgrel=3
pkgdesc="A command line utility that displays the status of internet game servers"
url="http://www.qstat.org/"
arch=('i686' 'x86_64')
license=('custom:Artistic')
depends=('glibc')
conflicts=('qstat-cvs' 'qstat-svn')
backup=('etc/qstat.cfg')
source=("http://downloads.sourceforge.net/sourceforge/qstat/${pkgname}-${pkgver}.tar.gz")
sha256sums=('16f0c0f55567597d7f2db5136a0858c56effb4481a2c821a48cd0432ea572150')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed "s#strndup#strndupz0r#g" -i qstat.c

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Install License
    install -D -m 0644 LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

