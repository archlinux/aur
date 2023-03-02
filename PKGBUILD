# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Crowdsec Team <debian@crowdsec.net>

pkgname=crowdsec-bin
_pkgname=crowdsec
pkgver=1.4.6
pkgrel=1
pkgdesc="The open-source and collaborative IPS (binary version)"
arch=('x86_64' 'aarch64')
url="https://crowdsec.net"
license=('MIT')
install=crowdsec-bin.install
source=(crowdsec-bin.install
	crowdsec-upgrade.service
	crowdsec-upgrade.timer)
backup=('etc/crowdsec/config.yaml' 
	'etc/crowdsec/console.yaml' 
	'etc/crowdsec/profiles.yaml' 
	'etc/crowdsec/simulation.yaml' 
	'etc/crowdsec/notifications/email.yaml'
	'etc/crowdsec/notifications/http.yaml'
	'etc/crowdsec/notifications/slack.yaml'
	'etc/crowdsec/notifications/splunk.yaml')


source_x86_64=(https://packagecloud.io/crowdsec/crowdsec/ubuntu/pool/jammy/main/c/crowdsec/${_pkgname}_${pkgver}_amd64.deb)
source_aarch64=(https://packagecloud.io/crowdsec/crowdsec/ubuntu/pool/jammy/main/c/crowdsec/${_pkgname}_${pkgver}_arm64.deb)
optdepends=(
	'docker: Used to run metabase container for statistics'
	'libnewt: Used for interactive mode of crowdsec_wizard.sh'
)

provides=('crowdsec')

prepare() {
   bsdtar -xf ${srcdir}/data.tar.zst 
 
}


package() {
   mkdir -p ${pkgdir}{'/etc','/usr'}
   cp -r ${srcdir}/etc/crowdsec ${pkgdir}/etc
   cp -r ${srcdir}/usr ${pkgdir}
   cp -r ${srcdir}/lib/systemd ${pkgdir}/usr/lib 
   install -Dm644 -t "$pkgdir"/usr/lib/systemd/system crowdsec-upgrade.*
}

sha256sums=('ef36af8a02a3996465b0e297d4502dbfaea2725ee19eca2d7c6d9004dd181f60'
            'f80645f04b5014ae2495f530bf076e48e850bd394fb8689ea2682a1573f2dffc'
            'c13d17811fea705bd53581de4966ade9b669742c63ec840c4848ad7e07cca36f')
sha256sums_x86_64=('f59d885215c2bd4720f357ce22586bae418e3c438602e6851604c1c1f0d315a5')
sha256sums_aarch64=('e4b1ed7720f54d50c39d4a53e7f1602b0f90149557505ce9b29065525c3dac2a')
