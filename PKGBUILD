# Maintainer: westlaw <niklas@arnitz.email>
# Contributor: slithin
pkgname=slithin-bin
pkgver=1.0.20.0
pkgrel=1
pkgdesc="A management application for your rM Tablet 1 and 2."
arch=('x86_64')
url="https://github.com/furesoft/Slithin"
license=('GPL-3.0')
groups=('')
depends=('aarch64-linux-gnu-gcc' 'dotnet-runtime' 'fontconfig' 'gcc' 'krb5' 'lttng-ust2.12' 'openssl' 'zlib')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/furesoft/Slithin/releases/download/1.0.20.0/Slithin.1.0.20.0.linux-x64.deb")
sha512sums_x86_64=("937217f5bdcdcd5bac4924fb3ad0dd304033bac08124f5e4676d25ead95fc6859e16565b793b3b429e98bc9cedc723a17cc39707069adc459afe108930b6db57")

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	ls usr/share/applications/*.desktop | while read line; do
	sed -i s'/^Exec=\/usr\/local\/bin\//Exec=\/usr\/bin\//g' "$line"
	done

	rm -rf usr/local

	cd ..

}
