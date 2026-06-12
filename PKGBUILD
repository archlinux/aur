# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> with contributions from Andreas Schweitzer <sig11@gmx.net>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=qstat
pkgver=2.18
pkgrel=1
pkgdesc="A command-line program that displays information about Internet game servers."
url="https://github.com/rocketsciencegg/qstat"
arch=('i686' 'x86_64')
license=('Artistic-2.0')
depends=('glibc')
conflicts=('qstat-cvs' 'qstat-svn' 'qstat-git')
backup=('etc/qstat.cfg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Unity-Technologies/qstat/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('95fecb97572d4f68f30689e74e71f3b105f0f4465ca58e21957a10ccf655d4e88537354a0a0e4d5695b1c75094a8d351453a6d7262e0f1063717df7ff5d8e426')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export QSTAT_VERSION="${pkgver}"
    ./autogen.sh
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

