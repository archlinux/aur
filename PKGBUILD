# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=out2html-git
_pkgname=out2html
pkgver=35.f632731
pkgrel=1
pkgdesc="Converts program output to HTML or pango markup (colorized)"
arch=('x86' 'x86_64')
url='https://github.com/DaveDavenport/out2html'
license=('GPL')
depends=('gtk3' 'glibc')
provides=('out2html')
makedepends=('git')
source=('git+https://github.com/DaveDavenport/out2html.git')

pkgver() {
	cd ${_pkgname}
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_pkgname}
    autoreconf --install
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make install DESTDIR="$pkgdir"
}

md5sums=('SKIP')
