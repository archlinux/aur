# Maintainer: Stick <stick at stma dot is>
# shellcheck disable=2034

pkgname=jrebel
pkgver=2020.1.1
pkgrel=1
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

sha256sums=('53f768793342228ffbbb868857cd018808b9749328e02e971b9293ab6fd4a0c5'
            '7dbc38b6bfc45a037620bd8a21583e00308d53311285c98215b660efdb007431'
            '6aab55f31601000e1f21ba6d42ecd363d55839a258ba5e489c7041f9b909d128'
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
