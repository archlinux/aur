# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=fairsoft
pkgver=jul15
pkgrel=1
pkgdesc="Software collection provided by GSI/FAIR for analysis."
arch=('x86_64')
url="http://fairroot.gsi.de"
license=('LGPL3')
groups=()
makedepends=('cmake'
	'clang'
	'bison'
	'flex'
	'gcc-fortran'
	'subversion'
	'git'
	'curl')
depends=(
	'libiodbc'
	'fcgi'
	'sqlite'
	'java-environment'
	'glu'
	'fftw'
	'cfitsio'
	'postgresql-libs'
	'python'
	'libjpeg-turbo'
	'graphviz'
	'libx11'
	'libxft'
	'libxext'
	'libxpm'
	'libxmu'
	)
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' '!strip' 'staticlibs' 'libtool')
install='fairsoft.install'
changelog=
source=("https://github.com/FairRootGroup/FairSoft/archive/${pkgver}.tar.gz"
	'arch.conf'
	'fairsoft.install')
noextract=()
md5sums=('1a8ab56423d357e6eeb1b5e59802617f'
         'd546737b7c15de7d71f6ea2090fa4b96'
         '748ceeb13cf954c4f732f93023ae879e')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	mv FairSoft-$pkgver FairSoft
	cd "FairSoft"

	# Disable vc for the root package (needed for gcc 4.9.2)
#	echo "Disabling vc for package root"
#	sed -i "s/--enable-vc/--disable-vc/" tools/rootconfig.sh

	# Enable optimizations for zeromq (needed from gcc 4.8)
	# to suppress warning about FORTIFY_SOURCE=2 needing optimization
#	echo "Enabling optimizations for zeromq"
#	sed -i '/\.\/configure.*$/a echo "Patching src/Makefile" \
#		sed -i "s/-O0/-O2/" src/Makefile' \
#		scripts/install_zeromq.sh
}

build() {
	:
}

package() {
	installdir=${pkgdir}/opt/fairsoft/${pkgver}-${pkgrel}/src

	cd "FairSoft"

	mkdir -p ${installdir}

	# Install files
	cp -r ${srcdir}/* ${installdir}
}
