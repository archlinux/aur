# Maintainer Bjoern Franke <bjo+aur@schafweide.org>
pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=8.23.1
pkgrel=1
pkgdesc="Agent of the OpenVox Automation Framework"
arch=('x86_64')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
options=('!debug')
conflicts=("puppet")
backup=("etc/puppetlabs/")

source_x86_64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian12_amd64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  ${srcdir}/data/opt ${pkgdir}/
    cp -a  ${srcdir}/data/etc ${pkgdir}/
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
md5sums_x86_64=('1a830d4a16f0f9c7c20e1a750e35b249')
