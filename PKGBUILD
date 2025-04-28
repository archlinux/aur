# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="lustre-tools-6"
pkgver=1.0.0
pkgrel=2
pkgdesc="The Lustre developpment tools free distribution version 6."
url="https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v4/distrib/"
arch=("x86_64")
license=("Free Distribution of the Lustre/Lesar Software")
makedepends=()
optdepends=()
depends=('findutils')
source=("https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v6/pre-compiled/x86_64-Linux-lv6-bin-dist.tgz")
sha256sums=("9dcf9db68826a7d25109bbf29ecd2c4a776544f9c3b635575a69db9fb5944711")

build() {
	cd "$srcdir/lv6-bin-dist"
	mv bin bin_
	mkdir bin
	for exec in $(cd bin_ ; ls)
	do
		echo '#!/bin/sh
set -e
export LUSTRE_INSTALL=/usr/share/lustre-tools-6
/usr/share/lustre-tools-6/bin_/'$exec' $@
' > "bin/$exec"
		chmod a+x "bin/$exec"
	done
}

package() {
	mkdir -p "$pkgdir/usr/share" "$pkgdir/etc/profile.d"
	cp -r "$srcdir/lv6-bin-dist" "$pkgdir/usr/share/lustre-tools-6"
	echo "append_path '/usr/share/lustre-tools-6/bin'
export PATH" > "$pkgdir/etc/profile.d/lustre-tools-6.sh"
}
