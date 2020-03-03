# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=rpmrebuild
_ver=2.15
_rel=1
pkgver=${_ver}.${_rel}
pkgrel=1
pkgdesc="A tool to build an RPM file from an existing package that has already been installed."
arch=('any')
url='https://sourceforge.net/projects/rpmrebuild'
license=('GPL')
depends=('rpm-tools')
makedepends=('tar')
changelog=changelog.html
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${_ver}/${pkgname}-${_ver}.tar.gz"{,.sig})
validpgpkeys=('9BBDC9B929A31EE71E1EDD71F52C885AD6F7A56A') # Eric Gerbier
noextract=("${pkgname}-${_ver}.tar.gz")
md5sums=('b08f82163304676e19ea540d5aa415f9'
         'SKIP')

prepare() {
	cd "$srcdir"
    # we need to use tar (and not bsdtar) because the archive includes hardlinks, which bsdtar doesn't handle very well.
	tar -xf "${pkgname}-${_ver}.tar.gz"
}

build() {
    cd "$srcdir"
    make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir/" install
}
