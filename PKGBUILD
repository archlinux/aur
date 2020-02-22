pkgname=grantlee-git
pkgver=v5.2.0.0.gb6454a9
pkgrel=1
pkgdesc="Grantlee is a string template engine based on the Django template system."
arch=('i686' 'x86_64')
url="http://www.grantlee.org"
license=('LGPL2.1')
depends=('qt5-base' 'qt5-script')
makedepends=('git' 'cmake')
optdepends=()
conflicts=('grantlee' 'grantlee-qt5-git')
provides=('grantlee' 'grantlee-qt5')
replaces=('grantlee-qt5-git')
source=("$pkgname"::'git+https://github.com/steveire/grantlee.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --tags --long)"
	printf "%s" "${ver//-/.}"
}

build() {
	mkdir "build"
	cd "build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "../$pkgname"
	make
}

package() {
	cd "build"
	make DESTDIR="$pkgdir/" install
}
