# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> with contributions from Andreas Schweitzer <sig11@gmx.net>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=qstat
pkgver=2.17
pkgrel=3
pkgdesc="A command-line program that displays information about Internet game servers."
url="https://github.com/Unity-Technologies/qstat"
arch=('i686' 'x86_64')
license=('Artistic-2.0')
depends=('glibc')
conflicts=('qstat-cvs' 'qstat-svn' 'qstat-git')
backup=('etc/qstat.cfg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Unity-Technologies/qstat/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}-${pkgver}-remove-unneeded-cast.patch")
b2sums=('e66aad52931443183ad91b19d5ed775c78babb0a5bd679c57fdf4c0ef604aab4e071bd16f97d151b84eb0b9b9814da271342a3494ec4123c5cf0ca10a8786341'
        'f1c4eeef81acf65678dc06e6a2fd2eade06156112c14e557443141a8662efb56ef1241e7b7ce7e16c0e02725643366d13d6cb5c78d9ea35de7e13ee8b9b7428b')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "../${pkgname}-${pkgver}-remove-unneeded-cast.patch"
}

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

