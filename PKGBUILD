# Contributor: Shane Joe Lazar <shane at archlinux dot us>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=mint-fm2
pkgver=3.25
pkgrel=5
pkgdesc="The Linux Mint Fluxbox menu system"
arch=('i686' 'x86_64')
url="http://community.linuxmint.com/tutorial/view/96"
license=('GPL')
groups=()
depends=('fluxbox' 'bash' 'inotify-tools' 'python2>=2.4' 'pygtk' 'glade' 'zenity' 'sed' 'menu-cache' 'mlocate' 'pm-utils')
makedepends=('sed' 'patch')
optdepends=('lxterminal' 'firefox' 'thunar' 'bc')
install=install
source=(http://packages.linuxmint.com/pool/main/m/"$pkgname"/"$pkgname"_"$pkgver".tar.gz
	'mint-fm2-3.25-arch.patch')

prepare() {
#Unpack source
#cd into source dir
	cd "${srcdir}"
#apply patch for Arch
	patch -p0 -i ../mint-fm2-3.25-arch.patch

}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
#copy to build dir
	cp -R usr ${pkgdir}/
	cp -R etc ${pkgdir}/
#remove Ubuntu upstart job
	rm -rf ${pkgdir}/etc/init
#create Arch init
#	mkdir -p ${pkgdir}/etc/rc.d/
#make sure scripts are executable
	chmod +x ${pkgdir}/usr/lib/linuxmint/mint-fm2/mfmrootdaemon
	chmod +x ${pkgdir}/usr/lib/linuxmint/mint-fm2/mfmuserdaemon
	chmod +x ${pkgdir}/usr/lib/linuxmint/mint-fm2/mint-fm2
}



# symlinks must be made in install script
# vim:set ts=2 sw=2 et:
md5sums=('618c5734322b23e363ad29b86a85e708'
         '1deaa10d1c05331118c5cbc1d907615f')
