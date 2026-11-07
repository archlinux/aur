# Maintainer: Noah Vogt <noah@noahvogt.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=tilp-xdg
pkgver=1.18
pkgrel=2
pkgdesc="TI graphing calculator link/transfer program - with Support for the XDG Base Directory Specification"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL2')
depends=('gtk2' 'libticalcs')
makedepends=('intltool')
provides=('tilp')
conflicts=('tilp')
optdepends=('gfm: to manage and manipulate TI Group Files (backups)')
source=("https://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-${pkgver}/tilp2-${pkgver}.tar.bz2"
        "remove-broken-kde-support.patch"
        "xdg-basedir.patch")
sha256sums=('7b3ab363eeb52504d6ef5811c5d264f8016060bb7bd427be5a064c2ed7384e47'
            'f659d7eae872f6448b7f0e7317e34c6a0c1c0b5d984f80d502bc660bad7819f4'
            '04a2b7161d65332b5489581adc2b4f212f07a886b1d9a6d95a99f244c21f624f')

prepare() {
  cd "${srcdir}/tilp2-${pkgver}"

  patch -Np1 < "${srcdir}/remove-broken-kde-support.patch"
  patch -Np1 < "${srcdir}/xdg-basedir.patch"
}

build() {
  cd "${srcdir}/tilp2-${pkgver}"

  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/tilp2-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
