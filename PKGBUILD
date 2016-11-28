pkgname=phpdocumentor1
pkgver=1.4.4
pkgrel=1
pkgdesc="A standalone auto-documentor similar to JavaDoc written in PHP (legacy version, if you really want it)"
arch=('any')
license=('LGPL2.1')
url='https://phpdoc.org/'
depends=('php56')
source=("http://downloads.sourceforge.net/project/phpdocu/PhpDoc/phpDocumentor-${pkgver}/PhpDocumentor-${pkgver}.tgz"
        "use-php56.patch"
        "lift-open_basedir.patch")
md5sums=('319243ed4e446323461f86f6fdc93149'
         '6a7035aeea14bec2e43a445be96f422d'
         '9ad5be0df9d5a02e3404d2fc1a34f791')

prepare() {
  cd "${srcdir}/PhpDocumentor-${pkgver}"

  patch -Np1 < "${srcdir}/use-php56.patch"
  patch -Np1 < "${srcdir}/lift-open_basedir.patch"
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  cp -a "${srcdir}/PhpDocumentor-${pkgver}" "${pkgdir}/usr/share/phpdocumentor1"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/phpdocumentor1/phpdoc" "${pkgdir}/usr/bin/phpdoc1"
}
