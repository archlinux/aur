# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

pkgbase=openrc-video
pkgname=('virtualgl-openrc')
pkgver=20170314
pkgrel=1.parabola2
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL')
groups=('openrc-video')
source=("vgl.confd::${_url}/x11-misc/virtualgl/files/vgl.confd-r2"
        "vgl.initd::${_url}/x11-misc/virtualgl/files/vgl.initd-r3"
        "${_url}/x11-misc/virtualgl/files/vgl-helper.sh")
sha256sums=('5356391cec2e297f2fafa370f42be225ad4238ac61182b90720a3d914261a80f'
            'e59320152be7d3631e3bdcd10be412b2ca1bc7c1bcdb135cb19142114e6358f0'
            '438c928840fbfb9274604296b8178e7f97b42a3428d115e1de6e609ea3146497')

pkgver() {
    date +%Y%m%d
}

_inst_initd(){
    install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

    sed -e 's|/var/run|/run|g' \
        -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
    install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_virtualgl-openrc() {
    pkgdesc="OpenRC virtualgl init script"
    depends=('openrc' 'virtualgl')
    install=virtualgl.install
    backup=('etc/conf.d/vgl')

    _inst_confd 'vgl'
    _inst_initd 'vgl'

    install -Dm755 "${srcdir}/vgl-helper.sh" "${pkgdir}"/usr/lib/vgl-helper.sh
    install -dm750 "${pkgdir}"/var/lib/VirtualGL
}
