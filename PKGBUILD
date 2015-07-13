# Maintainer: VirtualTam <virtualtam@flibidi.net>
# Contributor: Alexandre Boily <alexandreboily@gmail.com>
#
# NOTE
# The latest version, 2.0_20140824, can be installed with Composer:
#
# pacman -S php-composer
# composer global require phplint/phplint
pkgname=phplint11
pkgdesc="PHP 4 and 5 validator and documentator."
pkgver=1.1_20130803
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.icosaedro.it/phplint/'
license=('MIT')
depends=('gc')
source=("${url}/${pkgname}-pure-c-${pkgver}.tar.gz")
md5sums=('6c7b80444adaa31a5005b1b816d0cfda')

build() {
  ### Compile
  cd "${srcdir}/${pkgbase}-pure-c-${pkgver}"
  ./configure
  ./compile || return 1
}

package() {
  cd "${srcdir}/${pkgbase}-pure-c-${pkgver}"

  ### Create the paths and copy files
  mkdir -p ${pkgdir}/usr/share/phplint/
  mkdir -p ${pkgdir}/usr/share/licences/phplint/
  mkdir -p ${pkgdir}/usr/bin/
  cp ${srcdir}/${pkgbase}-pure-c-${pkgver}/src/phplint ${pkgdir}/usr/bin/
  cp -R ${srcdir}/${pkgbase}-pure-c-${pkgver}/modules ${pkgdir}/usr/share/phplint/

  ### Change the rights for module files
  chmod a+r ${pkgdir}/usr/share/phplint/modules/*
}
