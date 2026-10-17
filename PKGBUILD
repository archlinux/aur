pkgname=openvox8-agent-bin
_pkgname=openvox8-agent-bin
pkgver=8.31.0
pkgrel=1
pkgdesc='Agent of the OpenVox Automation Framework (non-modular)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=('libxcrypt-compat')
options=('!debug')
conflicts=('puppet' 'openvox' 'openvox-agent')
provides=('puppet' 'openvox' 'openvox-agent')
backup=('etc/puppetlabs/puppet/puppet.conf' 'etc/puppetlabs/puppet/hiera.yaml')

source_x86_64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_amd64.deb")
source_aarch64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_arm64.deb")
source_armv7h=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_armhf.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  "${srcdir}/data/opt" "${pkgdir}/"
    cp -a  "${srcdir}/data/etc" "${pkgdir}/"
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
b2sums_x86_64=('ce53f442cadebd033d91dbe20534c53074e1e1245551849c195052b8c6ee4bbdeb7bdb4d153928ef84b7f67c6104ecec4c1bdef4722555fe09f009faad71ae35')
b2sums_aarch64=('450b2436acab59528d7d5a6c986a92e6f0307ecd495ad4908e19e9fe1a9e8cf2e4880ef0cba968e78dd39f28e71ecfe29dcaf1ca08cd5e01813d9d32b6c9e526')
b2sums_armv7h=('67dfad036cdd2a75710abd6ff13d967ebab43ecf9f18a340797fd06d1f7cd70ef2fb264a627609600aa54ceacd262e9b6bdf119b9c2a49208149ade134b730ec')
