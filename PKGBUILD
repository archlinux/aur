# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python2-jpype1
pkgver=0.6.2
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/originell/jpype"
license=('APACHE')
depends=('java-environment' 'python2')
makedepends=('python2-distribute')
conflicts=('jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/originell/jpype/archive/v${pkgver}.tar.gz")
sha256sums=('e5a560f97d5248db5871aed7b2cd2bc854e3ebeb524c3eb7204600c048d83e1e')

build() { 
  cd "jpype-${pkgver}"
  if [[ -d /usr/lib/jvm/java-7-openjdk/include && -d /usr/lib/jvm/java-7-openjdk/include/linux ]]; then
    CFLAGS="${CFLAGS} -I/usr/lib/jvm/java-7-openjdk/include -I/usr/lib/jvm/java-7-openjdk/include/linux"
  fi
  python2 setup.py build
}

package() {
  cd "jpype-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

