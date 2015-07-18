# Maintainer: xpt <user.xpt@gmail.com>
pkgname=energyplus
pkgver=8.3
pkgrel=0
install="$pkgname.install"
pkgdesc="A building energy simulation engine to model energy and water use in buildings"
arch=('x86_64')
url="http://apps1.eere.energy.gov/buildings/energyplus/"
depends=('tar' 'gzip')
# makedepends=('cmake')
license=('GPL')
# source=("https://github.com/NREL/EnergyPlus/archive/v$pkgver.$pkgrel.tar.gz")
# md5sums=('761fc37599eb6e83af0e133472959dd8')
source=("https://github.com/NREL/EnergyPlus/releases/download/v$pkgver.$pkgrel/EnergyPlus-$pkgver.$pkgrel-6d97d074ea-Linux-x86_64.sh")
md5sums=('198a74169b5127379d33cc7002350f1e')

install_script=EnergyPlus-$pkgver.$pkgrel-6d97d074ea-Linux-x86_64.sh

# build (){
# cd "${srcdir}/"
# tar -xvf v$pkgver.$pkgrel.tar.gz
# cd EnergyPlus-$pkgver.$pkgrel
# cmake ../EnergyPlus-$pkgver.$pkgrel
# make
# }

# prepare() {
# # Se elimina al entrar en package
# man_directory="/usr/local/share/man/man1/"
# 
# link_directory="/usr/local/bin"
# mkdir -p ${pkgdir}${man_directory}
# mkdir -p ${pkgdir}${link_directory}
# mkdir -p ${pkgdir}${install_directory}

# cp -f EnergyPlus-$pkgver.$pkgrel-6d97d074ea-Linux-x86_64.sh $install_script
# sed -ie '4,84d' $install_script
# sed -i '3 a\cpack_license_accepted=TRUE \ninstall_directory='"${pkgdir}${install_directory}"' \nlink_directory='"${pkgdir}${link_directory}"' \n' $install_script
# sed -i '3 a\cpack_license_accepted=TRUE \ninstall_directory='${srcdir}'/opt \nlink_directory='${srcdir}'/usr/local/bin \n' $install_script

# sed -i 's@'"${man_directory}"'@'"${pkgdir}${man_directory}"'@g' $install_script

# sed -ie '26,95d' $install_script

# let n=`wc -l $install_script | awk {'print $1'}`+3
# n=`grep -n "exit 0" $install_script  | awk -F : {'print $1'}`;
# n=27
# let n=n+3
# sed -i 's/+177/+'$n'/g' $install_script
# }

package() {
package_name="EnergyPlus-${pkgver/./-}-$pkgrel"
install_directory="/opt"
mkdir -p ${pkgdir}${install_directory}
 
cd "${srcdir}/"
tail -n +177 $install_script | gunzip | (cd "${pkgdir}${install_directory}" && tar xf -) 
# echo "Unpacking to directory ${pkgdir}${install_directory} was successful."
# cd "${srcdir}/"
# chmod +x $install_script
# ./$install_script
# chmod +x "${srcdir}/opt"/EnergyPlus-${pkgver/./-}-$pkgrel/uninstall.sh
# mkdir -p ${pkgdir}/usr/bin/
# ln -sf ${pkgdir}${install_directory}/EnergyPlus-${pkgver/./-}-$pkgrel/runenergyplus ${pkgdir}/usr/bin/runenergyplus
}