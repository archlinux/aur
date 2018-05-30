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
pkgver=v4.4.1
pkgrel=1
pkgdesc="Maintained fork of the original Archey Linux system tool"
arch=('any')
url="https://git.io/archey4"
license=('GPL')
depends=('python3' 'lsb-release' 'procps')
optdepends=('bind-tools: `WAN_IP` would be detected 5x faster'
            'net-tools: Quicker local IP addresses detection'
            'wget: Needed if `bind-tools` is not present'
            'pciutils: [graphical env.] GPU would not be detected without it'
            'wmctrl: [graphical env.] `WindowManager` would be more accurate'
            'virt-what: [virtual env.] `Model` would contain details about the hypervisor')
provides=('archey' 'archey4')
conflicts=('archey' 'archey-git' 'archey-plus' 'archey2' 'archey3-git' 'pyarchey')
backup=('etc/archey4/config.json')
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8c80efa5d0c4b075e7ebd522aac92aa3')
sha256sums=('6c68c1abb85372fe4ef476a2f908505149a1c2457d4e926b3ec3305f9090f162')

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	install -D -m755 archey/archey.py ${pkgdir}/usr/bin/${pkgname}
	ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/archey

	install -D -m644 archey/config.json ${pkgdir}/etc/archey4/config.json
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 COPYRIGHT.md ${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT.md
}
