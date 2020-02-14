# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='cecilia'
pkgname="$_pkgname-git"
_reponame="${_pkgname}5"
pkgver='5.4.0.r2.gf8d35ad'
pkgrel='2'
pkgdesc='Audio signal processing environment aimed at sound designers - git version'
arch=('any')
url="http://ajaxsoundstudio.com/software/$_pkgname"
license=('GPL3')
depends=('python' 'python-pyo>=1.0.1' 'python-numpy>=1.18' 'python-wxpython>=4.0.7')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/belangeo/$_reponame"
	"$_pkgname.sh"
	"$_pkgname.desktop"
)
sha256sums=('SKIP'
            '0a17c0f9d4eb7195faaa99975628b610c821185f3ad712894029e5a135a54d4b'
            'eea84108fe4117b0ac6841f3f22247c270373a0d825fedcf56e6626a734d1a8d')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	local _libdir="usr/lib/$_pkgname"

	install -Dm644 "${_reponame^}.py" "$pkgdir/$_libdir/${_reponame^}.py"
	cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

	install -Dm755 "../$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "../$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	ln -sf "/$_libdir/Resources/${_reponame^}.ico" "$pkgdir/usr/share/pixmaps/$_pkgname.ico"
}
