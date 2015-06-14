# Maintainer: Chris Sakalis <chrissakalis@gmail.com>

pkgname="minutor-git"
pkgver=2.0.1.r91.g4ec245b
pkgrel=1
pkgdesc="A minimalistic map generator for minecraft."
arch=('i686' 'x86_64')
url="http://seancode.com/minutor/"
license=('BSD')
depends=(qt5-base)
provides=(minutor)
conflicts=(minutor)
source=("git+https://github.com/mrkite/minutor.git" "license.txt")
md5sums=('SKIP'
         'c169d81765c3f73db7353a198ca9fb98')
sha256sums=('SKIP'
            '7225ca2e326c72e6342d2aa188c3c38156d9a827276b46d6a8736c68819a34f6')

pkgver()
{
	cd "$srcdir/minutor"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build()
{
	cd "$srcdir/minutor"
	# XXX: If you are having compilation problems, try using qmake-qt5 instead
	# of qmake
	# qmake-qt5
	qmake
	make
}

package()
{
	cd "$srcdir/minutor"
	make INSTALL_ROOT="$pkgdir/" install
	cd "$srcdir"
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/minutor/license.txt"
}

