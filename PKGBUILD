# Submitter:	Bradley Klee <bradklee@gmail.com>
# Maintainer:	Bradley Klee <bradklee@gmail.com>
pkgname=pendulumdata
pkgver=1.2
pkgrel=3
pkgdesc="Digital Pendulum Data & Analysis"
arch=('any')
url="https://github.com/bradklee/DataAnalysis/tree/master/PlanePendulum"
license=('GPL')
depends=('python' 'gnuplot')
source=("https://github.com/bradklee/ArchBuilds/raw/master/PlanePendulum/PendulumDataV1.1.tar.gz"{,.sig})
md5sums=('bcef69ea2b0343a0881bec079e909859'
         'SKIP')
validpgpkeys=('EF6F2A81897A87838FDF67BB6B5766ADDC064400')

build() {
	cd "${srcdir}/PlanePendulum"
	# configure read / write 
	# arguments: PROGRAMBASE OUTBASE
	./config "/opt/PendulumData" "/tmp/Data/Pendulum"
	# note: can alternatively use OUTBASE="/home/$USER/Data/Pendulum"
	# fix install file
	sed -i 's~PROGRAMBASE="~PROGRAMBASE="'${pkgdir}'~g' ./inst
	sed -i 's~OUTBASE="~OUTBASE="'${pkgdir}'~g' ./inst	
}

package() {
	cd "${srcdir}/PlanePendulum"
	# file tree & copy
	./inst
	
	# link to executable
	mkdir -p "${pkgdir}/usr/bin"
	cd "${pkgdir}/usr/bin"
	ln -s /opt/PendulumData/PendulumData 
}

