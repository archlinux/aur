# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=gpc-git
_pkgname=gpc
pkgver=r1146.e7691789
pkgrel=1
pkgdesc='Geometic Algebra Algorithms Optimizer (Precompiler)'
arch=('any')
url='https://github.com/CallForSanity/Gaalop'
license=('GPL3')
depends=('jre8-openjdk')
makedepends=('jdk8-openjdk' 'maven')
source=("${pkgname}::git+https://github.com/CallForSanity/Gaalop#branch=gaalop_precompiler"
        'gpc')
sha256sums=('SKIP'
            'c3680dbdfe86bbf35361d9afa2f02155488625cc380e4689919c91284ca2c0b5')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mvn clean package
}

# Build Package
package() {
    cd ${srcdir}
    mkdir -p $pkgdir/usr/bin/
    cp -v gpc $pkgdir/usr/bin/

    cd ${pkgname}/distribution/target/distribution-*-bin/
    mkdir -p $pkgdir/usr/share/$_pkgname
    cp -rv * $pkgdir/usr/share/$_pkgname
}
