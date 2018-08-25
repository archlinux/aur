# Maintainer: Samuel FORESTIER <dev@samuel.domains>

############# How to package latest release ? #############
## $ git clone https://aur.archlinux.org/archey4.git
## $ cd archey4/
## $ nano PKGBUILD
## $ makepkg -g >> PKGBUILD
#### Clean fingerprints here...
## $ makepkg
## $ makepkg --printsrcinfo > .SRCINFO
###########################################################

pkgname=archey4
pkgver=v4.6.0
pkgrel=1
pkgdesc="Archey is a simple system information tool written in Python"
arch=('any')
url="https://git.io/archey4"
license=('GPL3')
depends=('python3' 'python-distro' 'procps')
optdepends=('bind-tools: `WAN_IP` would be detected faster'
            'net-tools: `LAN_IP` would be detected faster'
            'wget: Needed if `bind-tools` is not present'
            'pciutils: [graphical env.] GPU would not be detected without it'
            'wmctrl: [graphical env.] `WindowManager` would be more accurate'
            'virt-what: [virtual env.] `Model` would contain details about the hypervisor')
provides=('archey4' 'archey')
conflicts=('archey' 'archey-git' 'archey-plus' 'archey2' 'archey3-git' 'pyarchey')
backup=("etc/${pkgname}/config.json")
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('671aeb115aa65b8fbdfc8e7a098d996c')
sha1sums=('58d5e5462a0177242bb6939ca65c949fa39c7176')

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	install -D -m755 archey/archey.py ${pkgdir}/usr/bin/${pkgname}

	# Creates a symbolic link to provide `archey` command
	ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/archey

	install -D -m644 archey/config.json ${pkgdir}/etc/${pkgname}/config.json
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 COPYRIGHT.md ${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT.md
}
