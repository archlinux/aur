# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=python2-jpype1
pkgver=0.6.1
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('i686' 'x86_64')
url="https://github.com/originell/jpype"
license=('APACHE')
depends=('java-environment' 'python2')
makedepends=('python2-distribute')
conflicts=('jpype')
source=("https://pypi.python.org/packages/source/J/JPype1/JPype1-${pkgver}.tar.gz")
sha256sums=('0d366228b7b37b0266184161cc7ea1ce58f60199f6ec9451985149ea873774be')

build() { 
  cd "${srcdir}/JPype1-${pkgver}"
  if [[ -d /usr/lib/jvm/java-7-openjdk/include && -d /usr/lib/jvm/java-7-openjdk/include/linux ]]; then
    CFLAGS="${CFLAGS} -I/usr/lib/jvm/java-7-openjdk/include -I/usr/lib/jvm/java-7-openjdk/include/linux"
  fi
  python2 setup.py build
}

package() {
  cd "${srcdir}/JPype1-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

