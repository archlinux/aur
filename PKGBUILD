# Maintainer: Mikhail Artamonov <maximalis171091@yandex.ru>
# makepkg --printsrcinfo > .SRCINFO && makepkg -scC --nocheck --skipchecksums --skipinteg --skippgpcheck

pkgname=dmde-cli
pkg_name_32="dmde-4-2-0-814-lin32-con.zip"
pkg_name_64="dmde-4-2-0-814-lin64-con.zip"
pkgver=4.2.0
pkgrel=1
pkgdesc="DMDE is a powerful tool for data searching, editing, and recovery on disks - cli version"
arch=('x86_64' 'i686')
url="https://dmde.ru/"
license=('custom')
depends=(sudo)
makedepends=(unzip)
replaces=($pkgname)

source_x86_64=("https://dmde.ru/download/${pkg_name_64}")

source_i686=("https://dmde.ru/download/${pkg_name_32}")

source=(dmde-cli.desktop
		logo.png)

sha512sums=('1b6c947f0cf2ae001fe465031971b3b61fe79b7403ca1307f3693c4cc09b4a5c6698042b87fc95810f978ad152fa3edd46c5e22365b873e9b3959224f96ec2e1'
			'c32bbbb33b629b1953077fe9669a451c0adc308f94ce42c21e319ffe776695cb55c4d23831724186f966922a9fea073f8e65bb1f9a73afb5cb2e8075a0e5ebfe')

sha512sums_x86_64=('f8c15f1146d8cae297ca775ef5e255706c4d79c2c23acaeba38851275ddd1de57411bf6e093dfb80c898b5e11afabb0f87f92b16082cec4b917574689b713772')

sha512sums_i686=('34b2208cb64a88131e64a9eb103345368c8c65e839c6da861959be4f84c07e4178f246f30c0c7e3829963c1bc9d9fc935ba88e78d667013bbabba157c1384f84')

package_i686() {
	replaces=("${pkgname[0]}")
	depends=(sudo)
	cd $srcdir
	if [[ "${_archi[*]}" == "x86_64" ]]; then
		_pkgname=$(basename "${source_x86_64[0]}")
	else
		_pkgname=$(basename "${source_i686[0]}")
	fi
	mkdir -p ./usr/share/dmde-cli/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	rm -rf $srcdir/usr/share/dmde-linux/
	unzip "./${_pkgname[*]}" -d $srcdir/usr/share/dmde-cli/
	cp -r usr $pkgdir
	chmod +x $pkgdir/usr/share/dmde-cli/dmde
	chmod +x $pkgdir/usr/share/dmde-cli/dmde-su.sh
	install -vDm644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	chmod +x $pkgdir/usr/share/applications/$pkgname.desktop
	ln -sr /usr/share/dmde-cli/dmde $pkgdir/usr/bin/dmde-cli
}

package_x86_64() {
	replaces=("${pkgname[0]}")
	depends=(sudo)
	cd $srcdir
	if [[ "${_archi[*]}" == "x86_64" ]]; then
		_pkgname=$(basename "${source_x86_64[1]}")
	else
		_pkgname=$(basename "${source_i686[0]}")
	fi
	mkdir -p ./usr/share/dmde-cli/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	rm -rf $srcdir/usr/share/dmde-linux/
	unzip "./${_pkgname[*]}" -d $srcdir/usr/share/dmde-cli/
	cp -r usr $pkgdir
	chmod +x $pkgdir/usr/share/dmde-cli/dmde
	chmod +x $pkgdir/usr/share/dmde-cli/dmde-su.sh
	install -vDm644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	chmod +x $pkgdir/usr/share/applications/$pkgname.desktop
	ln -sr /usr/share/dmde-cli/dmde $pkgdir/usr/bin/dmde-cli
}
