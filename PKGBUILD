# Maintainer: X0rg
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 [at] gmail dot com>
# Contributor: Pierrick BRUN <pierrick.brun gmail.com>

LO_DIR=/usr/lib/libreoffice/share/config/
pkgname=libreoffice-faenza-mod
pkgver=0.4.2
pkgrel=2
pkgdesc="An icons pack for LibreOffice, inspired by Faenza icons"
arch=('any')
url="http://gnome-look.org/content/show.php/Faenza+Icons++for+LibreOffice++4.0.0?content=157970"
license=('GPL')
depends=('libreoffice')
conflicts=('libreoffice-flat-icon-set')
install=$pkgname.install
source=("LibreOffice_Faenza_$pkgver.tar.gz::https://github.com/X0rg/AUR-PKGBUILD/blob/master/$pkgname/LibreOffice_Faenza_$pkgver.tar.gz?raw=true")
md5sums=('fd0893791b93d989c6d8bdc7665f75c8')

prepare() {
	if [[ -z $LO_VER ]]; then
		msg2 "You can manually specify LibreOffice version with environnement variable 'LO_VER' if it fails."
	fi
}

package() {
	msg2 "Check LibreOffice version..."
	[[ -z $LO_VER ]] && LO_VER=$(pacman -Q libreoffice-still 2> /dev/null | awk '{ print $2 }' | cut -c1-3)
	[[ -z $LO_VER ]] && LO_VER=$(pacman -Q libreoffice-fresh 2> /dev/null | awk '{ print $2 }' | cut -c1-3)
	[[ -z $LO_VER ]] && error "LibreOffice version not found." && exit 1

	msg2 "Install Faenza icon theme for LibreOffice..."
	install -Dm644 "$srcdir/$LO_VER/Faenza/images_crystal.zip" \
		"$pkgdir/$LO_DIR/images_faenza.zip"

	msg2 "Install Faenza Dark icon theme for LibreOffice..."
	install -Dm644 "$srcdir/$LO_VER/Faenza_Dark/images_galaxy.zip" \
		"$pkgdir/$LO_DIR/images_faenza_dark.zip"
}
