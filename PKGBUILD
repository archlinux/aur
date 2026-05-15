# Maintainer Bjoern Franke <bjo+aur@schafweide.org>
pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=8.26.1
pkgrel=1
pkgdesc="Agent of the OpenVox Automation Framework"
arch=('x86_64')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=("libxcrypt-compat")
options=('!debug')
conflicts=("puppet")
backup=("etc/puppetlabs/")

source_x86_64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_amd64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  ${srcdir}/data/opt ${pkgdir}/
    cp -a  ${srcdir}/data/etc ${pkgdir}/
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
b2sums_x86_64=('0078d9f1e04b35616f2595690fc7bdd32f353d5d176d6b280e855cba11b17e7f4b1b772fd15f2bf8356b43fe4d846ab3e1f5dbcf8be2d11e79e09945047e1cc1')
