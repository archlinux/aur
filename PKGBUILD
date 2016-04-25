# Maintainer: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Rutger Broekhoff
pkgname=natron-bin
pkgver=2.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe After Effects'
url='http://natron.fr/'
license=('GPL')
depends=('ffmpeg' 'p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron' 'natron-rc' 'natron-bin-dev')

options=('!strip' '!upx')

source=("natron.desktop")
source_i686=("http://downloads.natron.fr/Linux/releases/32bit/files/Natron-$pkgver-Linux-x86_32bit.tar.xz")
source_x86_64=("http://downloads.natron.fr/Linux/releases/64bit/files/Natron-$pkgver-Linux-x86_64bit.tar.xz")

md5sums=('5c65b106c295abe0b5346eff18a06767')
md5sums_i686=('bba88a39dcdce3fc2a5a188d6c73362a')
md5sums_x86_64=('ade5286ff47cd299ec01cff9e02812cd')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="x86_64bit"
	else
		_source_arch="x86_32bit"
	fi

	install -d "$pkgdir"/opt
	cp -R "$srcdir"/Natron-$pkgver-Linux-$_source_arch "$pkgdir"/opt/natron

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/natron/Natron "$pkgdir"/usr/bin/natron

	install -Dm644 "$srcdir"/natron.desktop "$pkgdir"/usr/share/applications/natron.desktop
}
