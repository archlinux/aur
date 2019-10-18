# Maintainer: Stick <stick at stma dot is>
# shellcheck disable=2034

pkgname=jrebel
pkgver=2019.2.0
pkgrel=2
pkgdesc="Reload code changes instantly"
url="http://jrebel.com/software/jrebel/"
license=('custom')
arch=('i686' 'x86_64')
provides=('jrebel')
depends=('java-environment')
optdepends=('lib32-glibc: 32-bit support')
backup=('etc/profile.d/jrebel.sh'
		'etc/profile.d/jrebel.csh')
install=jrebel.install

source=("https://dl.zeroturnaround.com/jrebel/releases/$pkgname-$pkgver-nosetup.zip"
		"$pkgname.csh"
		"$pkgname.install"
		"$pkgname.sh")

sha256sums=('a3c81630c15e49c4021bd4c56e328f455e066d30e86a9dce84da9d41b3cf78bc'
			'7dbc38b6bfc45a037620bd8a21583e00308d53311285c98215b660efdb007431'
			'7616bc4c74f15c49c25c9db78aa0490a2cb88e37fe848c9e866c11ea16d0ad66'
			'd1a5193a071eeedb4d5e96a0eb90aaa4f7daad0cdfbe54ff9c89967c50634635')

package() {
	echo "Creating required directories"
	# shellcheck disable=2154
	mkdir -p "$pkgdir"/{opt/$pkgname,/etc/profile.d,usr/share/licenses/$pkgname}

	# shellcheck disable=2154
	cd "$srcdir/$pkgname" || exit

	echo "Removing .cmd files"
	rm bin/*.cmd

	echo "Installing licenses, scripts, and readme"
	mv 3rd-party-licenses-jrebel.txt License.txt readme.txt "$pkgdir/usr/share/licenses/$pkgname/"
	mv ./* "$pkgdir/opt/$pkgname"
	cd "$srcdir" || exit
	install -m755 $pkgname.{c,}sh "$pkgdir/etc/profile.d/"
}
