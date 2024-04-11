# Maintainer: JacobTech <Jacob@JacobTech.com>
pkgname='luski-beta-bin'
pkgver=0.0.0.1
pkgrel=2
pkgdesc="Simple open source chat app"
arch=('x86_64')
url="https://www.jacobtech.com/Luski"
license=('GPL')
depends=('dotnet-runtime-8.0' 'curl')
provides=('luski-beta')
conflicts=('luski-beta-contained-bin')
source=("luski-beta.tar.gz::https://www.jacobtech.com/Updater/GetPKG?directory=Luski&branch=Beta&selfcontained=false&platform=linux-x64")
md5sums=('SKIP')

pkgver() {
	printf "$(curl -s https://www.jacobtech.com/Updater/GetProgramVersion\?directory\=Luski\&branch\=Beta\&selfcontaind\=false\&platform\=linux-x64)"
}

package() {
	cd "${srcdir}"
	
	install -dm 755 "$pkgdir"/usr/lib/luski-beta
	install -dm 755 "$pkgdir"/usr/share/applications
	install -dm 755 "$pkgdir"/usr/bin

	cp -r ${srcdir}/*  "$pkgdir"/usr/lib/luski-beta/
	
	touch "$pkgdir"/usr/bin/luski-beta.sh
	cd "$pkgdir"/usr/bin
	echo -n "#!/bin/sh
exec /usr/lib/luski-beta/Luski \"\$@\"" >> "$pkgdir"/usr/bin/luski-beta.sh
	ln -s luski-beta.sh luski-beta

	touch "$pkgdir/usr/share/applications/luski beta.desktop"
	cd "$pkgdir"/usr/share/applications
	echo -n "[Desktop Entry]
Name=Luski Beta
Version=1.0
GenericName=Luski Beta
Comment=Luski is a free opensource chat app
Exec=luski-beta %f
Terminal=false
Type=Application" >> "$pkgdir/usr/share/applications/luski beta.desktop"

	
	chmod 755 "$pkgdir"/usr/bin/luski-beta
	chmod 755 "$pkgdir"/usr/lib/luski-beta/Luski
	chmod 755 "$pkgdir"/usr/bin/luski-beta.sh
}
