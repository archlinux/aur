# Maintainer Bjoern Franke <bjo+aur@schafweide.org>
pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=8.25.0
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
md5sums_x86_64=('050ac19b4368cb4cb539efaaac8711df')
