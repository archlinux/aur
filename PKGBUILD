pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.1.1
pkgrel=1
pkgdesc='Agent of the OpenVox Automation Framework (non-modular)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=('libxcrypt-compat')
options=('!debug')
conflicts=('puppet' 'openvox' 'openvox8-agent-bin')
provides=('puppet' 'openvox')
backup=('etc/puppetlabs/puppet/puppet.conf' 'etc/puppetlabs/puppet/hiera.yaml')

source_x86_64=("https://apt.voxpupuli.org/pool/openvox9/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_amd64.deb")
source_aarch64=("https://apt.voxpupuli.org/pool/openvox9/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_arm64.deb")
source_armv7h=("https://apt.voxpupuli.org/pool/openvox9/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_armhf.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  "${srcdir}/data/opt" "${pkgdir}/"
    cp -a  "${srcdir}/data/etc" "${pkgdir}/"
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
b2sums_x86_64=('f132798849669d28094b14f7295f928bd72d247f9c2a4af0b2ccaeebab4d79ff64138ac94e64b45ff173a7414d517de04b3665e70ee42f4f5bfde08f5d5f051c')
b2sums_aarch64=('5e49e51f279a29919a1e6d79f2cb64ca677129161c9642462e0d03c1e7f4646f208a9ddd85b8c00500d02308120cf10c50306cbfdccc8d0226abc373b97dc001')
b2sums_armv7h=('bda1b2be1704b13daad80615e9ff927fab9a12dc17931881a9ef5c1a51d8b112bbbf0d699fb202890f8ae74d8eec892b4f26a6ca33db8e5919e88564353864cd')
