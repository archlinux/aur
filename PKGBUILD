# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=rpmrebuild
_ver=2.11
_rel=3
pkgver=${_ver}.${_rel}
pkgrel=1
pkgdesc="a tool to build an RPM file from a package that has already been installed. It can be used to easily build modified packages, and works on any Linux distribution that uses RPM."
arch=('x86_64')
url='https://sourceforge.net/projects/rpmrebuild'
license=('GPL')
depends=('rpm-org')
makedepends=('tar')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${_ver}-${_rel}/${pkgname}-${_ver}.tar.gz"{,.sig})
validpgpkeys=('9BBDC9B929A31EE71E1EDD71F52C885AD6F7A56A') # Eric Gerbier
noextract=("${pkgname}-${_ver}.tar.gz")
md5sums=('28b865e8829cf7ab75b81d1c34c8c612'
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
