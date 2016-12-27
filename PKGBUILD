# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-ctags
_pkgname=ctags
pkgver=5.8_arduino10
_pkgver=5.8-arduino10
pkgrel=1
pkgdesc="A mix of ctags and anjuta-tags for the perfect C++ ctags"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="https://github.com/arduino/ctags"
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/arduino/${_pkgname}/archive/${_pkgver}.tar.gz"
        "CVE-2014-7204.patch")
sha512sums=('8d54ae4c165c687a8c2c0173c6eebe6c1862e2b6c7ba7332ce4ba73324c81a0c3f6d41c4a949d4caad8289ba408c4292de301ceb8f2f4031d23a231b124aad8e'
            '212ec5d3daec5ffadc3ffe60406fc1f6b76356f2c56f99e999f8bf0646891c0067144e5de8ccbbe9391a803cd4005fe94a5973911274928dd7c1414d1ec68477')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  patch -Np1 <../CVE-2014-7204.patch

  sed -i 's/^CTAGS_PROG =.*/CTAGS_PROG = arduino-ctags/' Makefile.in
  sed -i 's/^MANPAGE =.*/MANPAGE = arduino-ctags.1/' Makefile.in
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  ./configure --prefix=/usr \
              --disable-external-sort
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  make prefix=${pkgdir}/usr install
}
