# Maintainer: xpt <user.xpt@gmail.com>
pkgname=energyplus
pkgver=9.2.0
pkgrel=1
_relcode='921312fa1d'
install="$pkgname.install"
pkgdesc="A building energy simulation engine to model energy and water use in buildings"
arch=('x86_64')
url="http://apps1.eere.energy.gov/buildings/energyplus/"
depends=('tar' 'gzip')
# makedepends=('cmake')
license=('GPL')
# source=("https://github.com/NREL/EnergyPlus/archive/v$pkgver.$pkgrel.tar.gz")
# md5sums=('761fc37599eb6e83af0e133472959dd8')
source=("https://github.com/NREL/EnergyPlus/releases/download/v$pkgver/EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh")
md5sums=('624092d040ba71684eece747e4d7c65b')

install_script=EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh

package() {
package_name="EnergyPlus-${pkgver/./-}"
install_directory="/opt"
mkdir -p ${pkgdir}${install_directory}
 
cd "${srcdir}/"

n=$(head $install_script -n 200 | grep gunzip | awk {'print $3'})
tail -n ${n} $install_script | gunzip | (cd "${pkgdir}${install_directory}" && tar xf -) 

}
