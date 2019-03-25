# Maintainer: MatMoul <matmoul@gmail.com>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=alpm_octopi_utils
pkgver=1.0.0
_commit=7f3a6c7e0e46bf9acb54af472f4fe45ab632d58c
pkgrel=3
pkgdesc="Alpm utils for Octopi"
url="https://octopiproject.wordpress.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pacman')
makedepends=('vala')
source=("https://github.com/aarnt/${pkgname}/archive/${_commit}.zip")
sha256sums=('1be08455e2845fc03f4e4f3010e11c6946fb6dae7d0d9807c7ac5349dda04ba6')
         
build() {
    cd "$pkgname-$_commit"
    sed -i -e 's|Alpm.List<Package>|Alpm.List<unowned Package>|g' vapi/libalpm.vapi
    sed -i -e 's|Alpm.List<DB>|Alpm.List<unowned DB>|g' vapi/libalpm.vapi
    sed -i -e 's|Alpm.List<string>|Alpm.List<unowned string>|g' vapi/libalpm.vapi
    sed -i -e 's|Alpm.List<string>|Alpm.List<unowned string>|g' src/alpm_config.vala
    sed -i -e 's|public Alpm.List<string>|public Alpm.List<unowned string>|g' src/alpm_octopi_utils.vala
    sed -i -e 's|unowned Alpm.List<string> list = syncfirsts;|unowned Alpm.List<unowned string> list = syncfirsts;|g' src/alpm_octopi_utils.vala
    make
}

package() {
    cd "$pkgname-$_commit"
    install -D -m755 src/libalpm_octopi_utils.so "$pkgdir"/usr/lib/libalpm_octopi_utils.so
    install -D -m644 src/libalpm_octopi_utils.pc "$pkgdir"/usr/lib/pkgconfig/libalpm_octopi_utils.pc
    install -D -m644 src/alpm_octopi_utils.h "$pkgdir"/usr/include/alpm_octopi_utils.h
}
 
