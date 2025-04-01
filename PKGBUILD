# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# OLD-Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=sqlite2
pkgver=2.8.17
pkgrel=11
pkgdesc="A C library that implements an SQL database engine"
arch=('i686' 'x86_64')
url="http://www.sqlite.org/"
depends=('readline>=6.0.00')
license=('LicenseRef-sqlite2')
source=("https://www.sqlite.org/sqlite-$pkgver.tar.gz"
	'diff.shell.c'
	'diff.lemon.c'
	'diff.Makefile.in.c'
	'diff.main.mk.c'
        'LICENSE')

prepare() {
  cd "${srcdir}/sqlite-${pkgver}"

  patch -p0 < ../diff.shell.c
  patch -p0 < ../diff.lemon.c
  patch -p0 < ../diff.Makefile.in.c
  patch -p0 < ../diff.main.mk.c
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
         'bae02ef28e39d5bddfa7bbc2fbc8b17f'
         '21e7bd94a9d3f634bcb44715a2417113'
         'ba937ac84f643f5d47b456b115e4bfe4'
         '5d3b333e59a37747284f66081660f8a1')
sha256sums=('3f35ebfb67867fb5b583a03e480f900206af637efe7179b32294a6a0cf806f37'
            'b82dca7ffa2ae7ee279b2c8ac71841d9d388d89916cde50d7dcb82633ec055dc'
            '1e6b85687aabeeefd0776bc17e7e97ac82def8edf34b3df481ecc13e421918e4'
            '1450ce35e528bcd33f3880ff1e335e08747004665a196d10ae2291b4957651c3'
            '8817f45319367b2fb8966dc241919466caec70d543c5d4730b2fd6d2c27685d9'
            'f5c6d91e17fd798af2ab9106a067ac80331eb96a182859630d211e94f9164d10')
