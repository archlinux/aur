# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: JonimusPrime <jasturm002@aol.com>
# Contributor: wandrian <wandrian@tuxfamily.org>

pkgname=gfm
pkgver=1.08
pkgrel=1
pkgdesc="TIgroup files manipulator for TiLP"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_gfm/"
license=('GPL2')
depends=('libglade' 'libticalcs')
source=("http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}-${pkgver}.tar.bz2"
        "remove-broken-kde-support.patch")
sha256sums=('09031ac0abf686b6a8bc9935f331ef460415783a1057f11b0af993526b52017f'
            'e5fce2a297c00bb628024d626b70358daa6c490fe9f7f814e44328f66718d208')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/remove-broken-kde-support.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
