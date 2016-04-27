# Maintainer: Daniel Lawson <daniel dot lawson at mwrinfosecurity dot com>

pkgname=drozer
pkgver=2.3.4
pkgrel=2.1
pkgdesc='Comprehensive security and attack framework for Android'
arch=('i686' 'x86_64')
url='https://labs.mwrinfosecurity.com/tools/drozer'
license=('bsd')
options=('!strip')
provides=('drozer')

depends_x86_64=(
	'bash'
	'python2'
	'python2-protobuf'
	'python2-pyopenssl'
	'python2-twisted')
depends_i686=(
	'bash'
	'python2'
	'python2-protobuf'
	'python2-pyopenssl'
	'python2-twisted')
source_x86_64=("https://labs.mwrinfosecurity.com/system/assets/931/original/drozer_${pkgver}.deb")
source_i686=("https://labs.mwrinfosecurity.com/system/assets/931/original/drozer_${pkgver}.deb")
md5sums_x86_64=('901c7775fa2eb0e0c9943d380cf902a2')
md5sums_i686=('901c7775fa2eb0e0c9943d380cf902a2')

prepare() {
	# Extract out data file	
	tar -xf data.tar.gz
}

package() {
	# Bash completions get installed to a different location on Arch
	mkdir -p "${pkgdir}"/usr/share/bash-completion/completions/
	cp -dr --no-preserve=ownership etc/bash_completion.d/drozer "${pkgdir}"/usr/share/bash-completion/completions/

	# Arch uses python3 by default, so we have to explicitly call python2
	find . -type f -print0 | xargs -0 sed -i 's/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/'
	
	# Install rest of files
	cp -dr --no-preserve=ownership usr/{bin,share} "${pkgdir}"/usr/

	mkdir -p "${pkgdir}"/usr/lib/python2.7/
	cp -dr --no-preserve=ownership usr/local/lib/python2.7/dist-packages/{drozer,mwr,pydiesel} "${pkgdir}"/usr/lib/python2.7/
	


	
}
