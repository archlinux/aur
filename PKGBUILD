# Maintainer: Tomaz Canabrava <tomaz.canabrava@gmail.com>

pkgname=bde-tools
pkgver=3.117.0.0
pkgrel=1
pkgdesc="Build tools based on CMake for Bloomberg-style projects such as BDE"
arch=('any')
url="https://github.com/bloomberg/bde-tools"
license=('Apache')
depends=('python>=3.8'
 	'make'
	'gcc'
)

optdepends=(
	'ninja: Provides access to faster paralelized builds'
	'clang: Alternative to GCC compiler collection'
	'perl: Needed only for code generation'
)

source=("bde-tools::git+https://github.com/bloomberg/bde-tools#tag=${pkgver}")

md5sums=('SKIP')

install="bde-tools.install"

package() {
	cd "$pkgname"
	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	#remove the git information, we are not interested in that.
	rm -rf ".git"

	# copy the whole directory to `/usr/bin/bde-tools`
	# The official documentation of BDE Tools asks us to
	# download the binaries and change the $path variable
	# to point to it's internal `bin` folder.
	install -d "${pkgdir}/usr/bin/bde-tools"
	cp -r * "${pkgdir}/usr/bin/bde-tools"
}
