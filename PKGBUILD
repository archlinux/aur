pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.2.1
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
b2sums_x86_64=('5b52adb2cb1cbab1e6d0e73a1e7312fd0948afd184bb80a3df95a0e5ef68c087218cdd7dafca0f113811fe8292a64d57999ab3fb67dbac1039981cc1ae397827')
b2sums_aarch64=('936745a814e1d0dbd71fd18c3fa4132a164f8faff1dcade3888e3c6a8d95b46b46312f8e2afa9a8413f69012ba725eacd327fbe97bc2e3f9190368d5e2fc8e6a')
b2sums_armv7h=('8955d20c490edab64de82da62ae65ee552fec44e8ef8822ad03b67e7c481e0d3c38ab9db5e9984589dddbef99a2cbe3cc5e810554e5ba6ee8bfc41e0e654dd94')
