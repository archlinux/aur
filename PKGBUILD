# Maintainer : Bernhard Landauer <oberon@manjaro.org>

pkgname=clipit
_pkgname=ClipIt
pkgver=1.4.4
pkgrel=2
pkgdesc="Lightweight GTK+ clipboard manager (fork of Parcellite)"
arch=('i686' 'x86_64')
url="https://github.com/CristianHenzel/ClipIt/"
_snapshot=d6fab2be79b2fc8319b492a1a834300df64e4db8
license=('GPL3')
depends=('gtk2' 'libappindicator-gtk2')
makedepends=('intltool')
optdepends=('xdotool: for automatic paste')
source=("$url/archive/v$pkgver.tar.gz"
#    "${_pkgname}-${_snapshot}.tar.gz::${url}/archive/${_snapshot}.tar.gz"
    https://patch-diff.githubusercontent.com/raw/CristianHenzel/ClipIt/pull/90.patch
    )
md5sums=('d49b9171c0b81269deafab9d6ecc7610'
         '46e896a385ff9c8fa65c08d5d9d2e5c6')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i $srcdir/90.patch
}

build() {
  cd $_pkgname-$pkgver
#  cd "${srcdir}/${_pkgname}-${_snapshot}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-gtk3 \
    --enable-appindicator
  make
}

package() {
  cd $_pkgname-$pkgver
#  cd "${srcdir}/${_pkgname}-${_snapshot}"
  make DESTDIR=${pkgdir} install
}
