# Maintainer: Robin Broda <robin at broda dot me>

pkgname='ghidra'
pkgver=9.0
pkgrel=3
pkgdesc='A software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate'
arch=('x86_64')
url='https://ghidra-sre.org/'
license=('Apache')
depends=('java-environment>=11' 'bash')
optdepends=('python2: for the Python feature'
            'pam: for GhidraServer support')
source=('https://www.ghidra-sre.org/ghidra_9.0_PUBLIC_20190228.zip' 'ghidra')
sha256sums=('3b65d29024b9decdbb1148b12fe87bcb7f3a6a56ff38475f5dc9dd1cfc7fd6b2'
            'd1eac99a2d868c35aecb0ce66eba5f3d244cfd715510cd324821a05148b664a2')

prepare() {
	cd "${pkgname}_${pkgver}"

	# Fix JDWP RCE issue in debug mode
	sed -i 's/address=\*/address=127.0.0.1/' support/launch.sh
}

package() {
	cd "${pkgname}_${pkgver}"

	install -Dm755 ../ghidra "${pkgdir}/usr/bin/ghidra"
	install -dm655 "${pkgdir}/opt/ghidra"
	cp -R * "${pkgdir}/opt/ghidra/"
	chmod -R a+r "${pkgdir}/opt/ghidra"
}
