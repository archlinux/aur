# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> with contributions from Andreas Schweitzer <sig11@gmx.net>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=qstat
pkgver=2.14
pkgrel=1
pkgdesc="A command line utility that displays the status of internet game servers"
url="https://github.com/multiplay/qstat"
arch=('i686' 'x86_64')
license=('custom:Artistic')
depends=('glibc')
conflicts=('qstat-cvs' 'qstat-svn')
backup=('etc/qstat.cfg')
source=("https://github.com/multiplay/qstat/archive/v${pkgver}.tar.gz")
sha256sums=('ae906b74d4cce8057b5a265b76859101da8104c2a07c05f11a51f7c9f033ef8b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed "s#strndup#strndupz0r#g" -i qstat.c
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

