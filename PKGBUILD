# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=jpype
pkgver=0.5.4.2
pkgrel=2
pkgdesc="Allow Python programs full access to Java class libraries"
arch=('i686' 'x86_64')
url="http://jpype.sourceforge.net/"
license=('APACHE')
depends=('java-environment' 'python2')
makedepends=('python2-distribute')
source=("http://downloads.sourceforge.net/project/${pkgname}/JPype/0.5.4/JPype-${pkgver}.zip"
        "sets.patch")
md5sums=('2b34c008268c05fcb01ef612f42f65ac'
         '04d64be7b92d7c6b7adb354a36c2b6f2')

build() { 
  cd "${srcdir}/JPype-${pkgver}"
  patch -Np1 -i "${srcdir}/sets.patch"
  if [[ -d /usr/lib/jvm/java-7-openjdk/include && -d /usr/lib/jvm/java-7-openjdk/include/linux ]]; then
    CFLAGS="$CFLAGS -I/usr/lib/jvm/java-7-openjdk/include -I/usr/lib/jvm/java-7-openjdk/include/linux"
  fi
  python2 setup.py build
}

package() {
  cd "${srcdir}/JPype-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
