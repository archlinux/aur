# Maintainer: David Dotson <dotsdl at gmail dot com>
# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Antergos Devs <dev@antergos.com>
# Contributor: dmiranda at gmail dot com

pkgname=numix-frost-themes
_pkgname=Numix-Frost
_light=Numix-Frost-Light
_branch=numix-frost-light
pkgver=3.6.6
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos Edition'
arch=('any')
license=('GPL3')
groups=('themes' 'themes::gtk')
#url='https://github.com/Antergos/Numix-Frost'
url='http://numixproject.org/'
depends=('gtk-engine-murrine' 'gtk3>=3.18')
makedepends=('ruby-sass' 'npm' 'gulp')
replaces=('gtk-theme-numix-frost')
#source=('git+https://github.com/Antergos/Numix-Frost.git')
source=("https://github.com/Antergos/Numix-Frost/archive/${pkgver}.tar.gz")
sha256sums=('8b29ebb6aeb2bb56c0992d90937e9fb30ea955dc7ac2ca57b89aa3c325eeeed1')

build() {
	git clone https://github.com/Antergos/Numix-Frost.git "${srcdir}/${_pkgname}"
	git clone https://github.com/Antergos/Numix-Frost.git "${srcdir}/${_light}"
}

package() {

	# Numix-Frost
	cd "${srcdir}/${_pkgname}"
	git checkout "${pkgver}"
	sed -i 's| unity||g' scripts/utils.sh
	make DESTDIR="${pkgdir}" install


	# Numix-Frost-Light
	cd "${srcdir}/${_light}"
	git checkout "${pkgver}-light"
	sed -i 's| unity||g' scripts/utils.sh
	make DESTDIR="${pkgdir}" install

}
