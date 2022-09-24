# Maintainer: Guillaume ALAUX <guillaume@archlinux.org> 
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=cowsay-color-patch
provides=(cowsay)
conflicts=(cowsay)
pkgver=3.04
pkgrel=3
pkgdesc='Configurable talking cow (and a few other creatures). Patched to better support ANSI colors and UTF8 characters.'
arch=('any')
url='http://www.nog.net/~tony/warez/'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-text-charwidth')
source=(https://github.com/tnalpgge/rank-amateur-cowsay/archive/cowsay-$pkgver.tar.gz
        cowsay.patch
		03-ansi_code_width_color_widechar.patch
		utf8_width.patch
		)
sha512sums=('99d21ef9a7c7c76056cb7acb2c771fbdabfedde4f6edb5d3035337c59f9e88944690d1b43282c32827ad79339199716366c8be73b0dea09063ec2d52220c1b51'
            '4c70074fc88e741f2eb4daa04a55ef3ff0638bffda907fe451299aeb2271a3b09c4b73df4d3eb83f6ac91b9cb05530bb2a59df81c72602728441254624a05327'
            '7faa2d250df75cd0b686255255dbecf82e717ab813d772e7e7b7adb56a94f05f067e7084d8c5d4b6ed938a7ce348113dda68303e8bf85b16e6d1faa7cc8c33dd'
            'a801fb46b2af45b26e9b103c0e291503b7cdd7e1ab2b366e5c3640cba9cb6b12c1308cbc0c5af90942b276c73da9acf29c35168797b65a55f88ed2cb99110055')

build() {
	cd rank-amateur-cowsay-cowsay-${pkgver}
	patch -p1 -i "$srcdir"/cowsay.patch
	patch -p1 -i "$srcdir"/03-ansi_code_width_color_widechar.patch
	patch -p1 -i "$srcdir"/utf8_width.patch
	sed -i 's|/man/|/share/man/|' install.sh
}

package() {
	cd rank-amateur-cowsay-cowsay-${pkgver}
	echo "${pkgdir}/usr" | ./install.sh
	# This one is not a valid '.cow' file
	rm "${pkgdir}"/usr/share/cows/mech-and-cow
}
