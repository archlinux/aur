pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=8.28.1
pkgrel=1
pkgdesc='Agent of the OpenVox Automation Framework (non-modular)'
arch=('x86_64' 'aarch64')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=('libxcrypt-compat')
options=('!debug')
conflicts=('puppet' 'openvox')
provides=('puppet' 'openvox')
backup=('etc/puppetlabs/puppet/puppet.conf' 'etc/puppetlabs/puppet/hiera.yaml')

source_x86_64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_amd64.deb")
source_aarch64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_arm64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  "${srcdir}/data/opt" "${pkgdir}/"
    cp -a  "${srcdir}/data/etc" "${pkgdir}/"
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
b2sums_x86_64=('255c4cd1c61d831e30fcb338bf803310fba7c0d33369545ad7139ee2295afd6d0e55eb0166a2811c9ddbf06c35127c8ce243ce565659789f0fef9ef4700fa129')
b2sums_aarch64=('7cbe26a72fc792b002dc0f98119bf85864ba82fe3e0ba7446104b61b0fecd42b1da0451d35295c4225eb00e0008bdc29ea2fa0a7541721d1301459017335a5fb')
