# Maintainer: xpt <user.xpt@gmail.com>
pkgname=energyplus
pkgver=9.3.0
pkgrel=1
_relcode='64d91887f6'
install="$pkgname.install"
pkgdesc="A building energy simulation engine to model energy and water use in buildings"
arch=('x86_64')
url="http://apps1.eere.energy.gov/buildings/energyplus/"
depends=('tar' 'gzip')
# makedepends=('cmake')
license=('GPL')
source=("https://github.com/NREL/EnergyPlus/releases/download/v$pkgver/EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh")
md5sums=('d41d8cd98f00b204e9800998ecf8427e')

install_script=EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh

package() {
package_name="EnergyPlus-${pkgver/./-}"
install_directory="/opt"
mkdir -p ${pkgdir}${install_directory}
 
cd "${srcdir}/"

n=$(head $install_script -n 200 | grep gunzip | awk {'print $3'})
tail -n ${n} $install_script | gunzip | (cd "${pkgdir}${install_directory}" && tar xf -) 

}
