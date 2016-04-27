pkgname=coova-chilli-git
pkgver=1.3.0
pkgrel=1
pkgdesc='an open-source software access controller'
arch=('any')
url="https://coova.github.io/"
license=('GPL')
depends=('curl' 'libpcap')
optdepends=('python')
makedepends=('git' 'autoconf' 'make' 'gcc' 'm4')
md5sums=('SKIP')

options=(!libtool)
source=("$pkgname"::'git+https://github.com/coova/coova-chilli')
backup=('etc/chilli.conf')
package() {
    msg "Starting build..."
    cd "$srcdir/$pkgname"

    sh bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var \
        --enable-statusfile \
        --enable-sessionstate \
        --enable-sessionid \
        --disable-static \
        --enable-miniportal
    make
    make DESTDIR="${pkgdir}" install
    rm -rf ${pkgdir}/etc/init.d
}


