# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=kate-latex-plugin
_pkgname=katelatexplugin
pkgver=0.5
pkgrel=1
pkgdesc="Kate LaTeX typesetting plugin"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/Kate+LaTeX+typesetting+plugin?content=84772"
license=('GPL')
depends=('kdesdk-kate' 'libxtst')
makedepends=('automoc4')
source=(http://kde-apps.org/CONTENT/content-files/84772-${_pkgname}-${pkgver}.tar.bz2)
md5sums=('d6e30aa41da5279300f5d638ff595a77')

build()
{
  if [[ -d ${srcdir}/build ]]; then
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"; cd "${srcdir}/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
        ../${_pkgname}-${pkgver}
  make
}

package()
{
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
