#Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>

pkgname=viper-framework-git
provides=("viper-framework")
conflicts=("viper-framework")
pkgver=v1.2.1133.cd7b753
pkgrel=2
pkgdesc="Git version of Viper the Binary Analysis Framework"
arch=("any")
url="https://github.com/viper-framework/viper"
license=("BSD")
depends=(
"python2-pyexiftool" "python2-pylzma" "python2-bottle" "python2-pyelftools" 
"python2-bitstring" "python2-dnspython" "python2-m2crypto" "python2-pyasn1" 
"python2-requests" "python2-sqlalchemy" "python2-prettytable" "python2-magic" 
"python2-pydeep" "ssdeep" "python2-ssdeep" "python2-beautifulsoup4" 
"python2-pefile" "python2-crypto" "python2-olefile" "python2-oletools"
"python2-django" "python2-pymisp" "python2-scandir" "python2-pypssl"
"python2-pypdns" "python2-pype32" "python2-pbkdf2" "python2-dateutil"
"python2-requests-cache" "python2-cffi" "python2-cryptography"
"python2-terminaltables" "python2-virustotal-api" "radare2-bindings"
"python2-enum34" "python2-idna" "python2-ipaddress" "python2-pycparser"
"python2-six") 
makedepends=("git")
source=("git+https://github.com/viper-framework/viper")
sha512sums=("SKIP")
install="viper-framework.install"
pkgver() {
	cd viper
	printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd viper
	python2 -m compileall .
	python2 -O -m compileall .
}

package() {
	cd "${srcdir}/viper"
	mkdir -p "${pkgdir}/opt/viper/"
	mv * "${pkgdir}/opt/viper/"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}/opt/viper/"viper-{api,cli,update,web}
}
