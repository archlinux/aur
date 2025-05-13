# Maintainer: David Adler <d.adler@posteo.de>
# Maintainer: Felix Salfelder <felix aet salfelder dott org>

_pkgname=gnucap
pkgname=$_pkgname-git
pkgver=20250301.dev.r86.g28914f11
pkgrel=1
pkgdesc="GNU Circuit Analysis Package (develop branch)"
arch=('x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('readline')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://git.sv.gnu.org/$_pkgname.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir/" install
}

