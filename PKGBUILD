# Maintainer: Dazzy Ding <h(at)dazzyd.org>
# Contributor: Justin Wong <justin.w.xd(at)gmail(dot)com>

pkgname=npd6-git
_gitname=npd6
pkgver=r130.ad66f24
pkgrel=1
pkgdesc='A Linux daemon to provide a proxy service for IPv6 Neighbor Solcitations received by a gateway routing device.'
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
url='http://npd6.github.io/npd6/'
conflicts=('npd6')
provides=('npd6')
source=("git://github.com/npd6/npd6.git"
        "npd6.service"
        "npd6.install")
md5sums=('SKIP'
         '319cc4f814a322e6aa9032c4d0f41dc6'
         'c9516ae0cefd3f29247f9971eb6eeced')
install=npd6.install

pkgver() {
    cd ${srcdir}/${_gitname}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_gitname}

    make
}

package() {
    cd ${srcdir}

    install -D -m 644 npd6.service ${pkgdir}/usr/lib/systemd/system/npd6.service

    cd ${_gitname}

    install -D -m 755 npd6 ${pkgdir}/usr/bin/npd6
    install -D -m 644 etc/npd6.conf.sample ${pkgdir}/etc/npd6.conf.sample
    install -D -m 644 man/npd6.conf.5.gz ${pkgdir}/usr/share/man5/npd6.conf.5.gz
    install -D -m 644 man/npd6.8.gz ${pkgdir}/usr/share/man8/npd6.8.gz
}
