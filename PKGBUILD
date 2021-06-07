# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# OLD-Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=sqlite2
pkgver=2.8.17
pkgrel=10
pkgdesc="A C library that implements an SQL database engine"
arch=('i686' 'x86_64')
url="http://www.sqlite.org/"
depends=('readline>=6.0.00')
license=('custom')
source=("https://www.sqlite.org/sqlite-$pkgver.tar.gz"
	'diff.shell.c'
        'LICENSE')

prepare() {
  cd "${srcdir}/sqlite-${pkgver}"

  patch -p0 < ../diff.shell.c
}
build() {
  cd ${srcdir}/sqlite-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/sqlite-${pkgver}

  make DESTDIR=${pkgdir} install

  # install custom license
  install -Dm644 ${srcdir}/LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE 
}
md5sums=('838dbac20b56d2c4292e98848505a05b'
         '2dc20964fbc46377f4737ae2d7365c11'
         '5d3b333e59a37747284f66081660f8a1')
sha256sums=('3f35ebfb67867fb5b583a03e480f900206af637efe7179b32294a6a0cf806f37'
            'b82dca7ffa2ae7ee279b2c8ac71841d9d388d89916cde50d7dcb82633ec055dc'
            'f5c6d91e17fd798af2ab9106a067ac80331eb96a182859630d211e94f9164d10')
