# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=qstat-git
pkgver=r391.60dc5e4
pkgrel=1
pkgdesc="A command line utility that displays the status of internet game servers"
url="https://github.com/multiplay/qstat"
arch=('i686' 'x86_64')
license=('Artistic2.0')
depends=('glibc')
makedepends=('subversion')
replaces=('qstat-cvs' 'qstat-svn')
conflicts=('qstat' 'qstat-cvs' 'qstat-svn')
provides=('qstat')
source=('qstat::git+https://github.com/multiplay/qstat.git')
sha256sums=('SKIP')

pkgver() {
    cd "qstat"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/qstat"

    sed "s#strndup#strndupz0r#g" -i qstat.c

    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/qstat"

    make DESTDIR="${pkgdir}" install
}
