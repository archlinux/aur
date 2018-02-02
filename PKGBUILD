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
pkgver=v4.3.3
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
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('dac84f78399561c3eeedd19c3f86b8a6')
sha256sums=('d0f7ed3832e162915a02ced2e706b4593f47a54ea06749b1b2200b605e2b1ba7')

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	install -D -m755 archey ${pkgdir}/usr/bin/${pkgname}
	ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/archey

	install -D -m644 config.json ${pkgdir}/etc/archey4/config.json
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 COPYRIGHT.md ${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT.md
}
