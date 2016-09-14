# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-pure')

_pkgname=enchant
pkgver=1.6.1
pkgrel=1

pkgdesc="A wrapper library for pure and generic spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('any')
license=('LGPL')

depends=('aspell>=0.50.0' 'dbus-glib>=0.62' 'hunspell')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!libtool')

source=("https://github.com/AbiWord/${_pkgname}/archive/${_pkgname}-${pkgver//./-}.tar.gz"
        "warnings-fix.patch")
sha512sums=('971462f8228a1033536a461ddcd9d4c124df5e9b791bd0e996173f56909345639e37cec0950ee3d9f320d985249df4b492eda70e659386c160a240c7b8572e06'
            'a504286ae22ccbc0b3da009c14c8c85506f8b013305808f1dd664f12a346db354d290e9873a54518e3b56687fef75a474e5b385eed4c81f4227bc25d1fc92e7c')

prepare() {
  mv "${srcdir}/${_pkgname}-${_pkgname}-${pkgver//./-}/" "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../warnings-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-static=no --disable-ispell --disable-hspell --disable-voikko --with-myspell-dir=/usr/share/myspell
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

