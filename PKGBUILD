# This is my first PKGBUILD

# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andrey Pavlenko <andrey.pavlenko@mail.ru>
# Updated 2013-10-17 by ammon message.
pkgname=rk-tools
pkgver=1.0
pkgrel=2
pkgdesc="RockChip tools for RK29xx and RK30xx generations, mainly to modify ROMs (http://www.cnx-software.com/2012/11/04/rockchip-rk3066-rk30xx-processor-documentation-source-code-and-tools/)."
arch=(i686 x86_64)
url="https://github.com/rk3066/rk-tools.git"
license=('unknown')
groups=('system')
depends=()
makedepends=('gcc' 'make' 'git')

package() {
	cd $srcdir

	# If directiry alredy exists
	if [ -d $pkgname ]; then
		# If .git exists
		if [ -d "$pkgname/.git" ]; then
			# Checkout
			cd $pkgname
			git checkout
		else
			# ==== Remove dir if it has no .git ===
			rm -R $pkgname || return 1
		fi
	else
		git clone $url
		cd $pkgname
	fi
	make || return 1

	mkdir -p $pkgdir/usr/bin
	install $srcdir/$pkgname/afptool $pkgdir/usr/bin
	install $srcdir/$pkgname/img_maker $pkgdir/usr/bin
	install $srcdir/$pkgname/img_unpack $pkgdir/usr/bin
	install $srcdir/$pkgname/rkcrc $pkgdir/usr/bin
	install $srcdir/$pkgname/rkkernel $pkgdir/usr/bin
}
