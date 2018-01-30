# Maintainer: Samuel FORESTIER <contact@samuel.domains>

############# How to package latest release ? #############
## $ git clone https://aur.archlinux.org/archey4.git
## $ cd archey4/
## $ nano PKGBUILD
## $ updpkgsums
## $ makepkg
## $ makepkg --printsrcinfo > .SRCINFO
###########################################################

pkgname=archey4
pkgver=v4.3.2
pkgrel=1
pkgdesc="Maintained fork of the original Archey Linux system tool"
arch=('any')
url="https://git.io/archey4"
license=('GPL')
depends=('python3' 'lsb-release' 'procps')
optdepends=('dnsutils: `WAN_IP` would be detected 5x faster'
            'net-tools: Quicker local IP addresses detection'
            'pciutils: [graphical env.] GPU would not be detected without it'
            'wmctrl: [graphical env.] `WindowManager` would be more accurate'
            'virt-what: [virtual env.] `Model` would contain details about the hypervisor')
provides=('archey' 'archey4')
conflicts=('archey' 'archey-git' 'archey-plus' 'archey2' 'archey3-git' 'pyarchey')
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5e2e4de0a86d442ef6843d19644c6a57')
sha256sums=('b27c8ad9c4a4ee7d649699e600e49642eacce4290f7aa5fe51f8ad980cde1def')

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	install -D -m755 archey ${pkgdir}/usr/bin/${pkgname}
	ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/archey

	install -D -m644 config.json ${pkgdir}/etc/archey4/config.json
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 COPYRIGHT.md ${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT.md
}
