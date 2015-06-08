# Maintainer Evgeniy Alexeev <esalexeev@gmail.com>
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=ghemical-mpqc
_pkgname=ghemical
pkgver=3.0.0
pkgrel=3
pkgdesc='Computational chemistry package. Version with enabled mpqc'
arch=('x86_64' 'i686')
url="http://bioinformatics.org/ghemical/ghemical/"
license=('GPL')
depends=('gtkglext' 'libghemical-mpqc' 'libglade' 'liboglappth>=1.0' 'openbabel')
makedepends=('pkgconfig' 'intltool>=0.40.0' 'gettext')
conflicts=('ghemical')
provides=('ghemical')
source=(http://bioinformatics.org/ghemical/download/release20111012/${_pkgname}-${pkgver}.tar.gz
        ${_pkgname}.desktop)
md5sums=('becf98626f0eba73f7f042bc92aa60ac'
         '7e8789d42d1318a427a30f3bf64cb5a6')

prepare()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Some users have reported crashes due to the courier font.
  sed -i 's:courier 12:monospace:g' ./src/*.cpp
}

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix="/usr"
  make
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
