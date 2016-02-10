# Contributor: Philipp Schwarz <fi-dschi_archlinux - at - arcor - dot - de>
# Maintainer: SanskritFritz (gmail)

pkgname=areca-bin
pkgver=7.5
pkgrel=2
pkgdesc="Personal file backup software supporting compression, encryption and incremental backups."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-runtime')
provides=('areca')
conflicts=('areca')
url='http://www.areca-backup.org'
source=("areca.sh"
	"areca_cl.sh"
	"areca_decrypt.sh"
	"areca_dezip.sh"
	"areca.desktop")
source_i686=("http://sourceforge.net/projects/areca/files/areca-stable/areca-${pkgver}/areca-${pkgver}-linux-gtk-32.tar.gz")
source_x86_64=("http://sourceforge.net/projects/areca/files/areca-stable/areca-${pkgver}/areca-${pkgver}-linux-gtk-64.tar.gz")

package() {
	mkdir -p "${pkgdir}/opt/"
	cp -r  "${srcdir}/areca"  "${pkgdir}/opt/"

	# copy start scripts to /usr/bin for they then will be in $PATH
	# these contain the full fixed path of /opt/areca/bin/areca_run.sh
	for _script in "areca" "areca_cl" "areca_decrypt" "areca_dezip"
	do
		install -D "${startdir}/${_script}.sh" "${pkgdir}/usr/bin/${_script}"
	done

	# symlink menu icon
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	ln -s "/opt/areca/icons/ico_72.png" "${pkgdir}/usr/share/pixmaps/areca_72x72.png"

	# copy .desktop file (menu entry)
	install -D "${startdir}/areca.desktop" "${pkgdir}/usr/share/applications/areca.desktop"
}

#makepkg --geninteg >> PKGBUILD

md5sums=('024e3fe74c518a9dee889f3ea1ff9f71'
         '662d65e44fe0806cff69850dae55f107'
         '8e0088445454ab80a9f04c84b3363814'
         '2f1bd15c94600065c43366f440cc0c37'
         '5e978edc20d715cefec098e3e77a3721')
md5sums_i686=('1b526a9284160ab4a5396b509a3efad8')
md5sums_x86_64=('3ebc02dd7276dea4a928c78e7db581a6')
