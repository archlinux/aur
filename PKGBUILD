# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> with contributions from Andreas Schweitzer <sig11@gmx.net>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=qstat
pkgver=2.17
pkgrel=1
pkgdesc="A command-line program that displays information about Internet game servers."
url="https://github.com/Unity-Technologies/qstat"
arch=('i686' 'x86_64')
license=('Artistic-2.0')
depends=('glibc')
conflicts=('qstat-cvs' 'qstat-svn')
backup=('etc/qstat.cfg')
source=("https://github.com/Unity-Technologies/qstat/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('880549d220a9a9046910bc2e5564b09349870110c77249b66d2ca77143327c83473da31c00e7b70df45f48e6a5bcb3310487f73983d745a69e6aa6278a125278')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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

