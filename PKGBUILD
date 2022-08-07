# Maintainer: ookami <mail@ookami.one>
pkgname=proxy-ns
pkgver=1.0.1
pkgrel=1
pkgdesc="Run programs in a network namespace where all traffic go through proxy"
arch=('x86_64')
url="https://github.com/OkamiW/proxy-ns"
license=('GPL')
depends=('bash' 'glibc' 'libcap' 'iproute2' 'badvpn-git')
makedepends=('make')
source=("git+$url")
sha512sums=('SKIP')
backup=(
    etc/proxy-nsd.conf
)

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    setcap cap_sys_admin=ep $pkgdir/usr/bin/proxy-ns
}
