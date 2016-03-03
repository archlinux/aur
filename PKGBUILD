# Maintainer: Chris <christopher.r.mullins g-mail>

pkgname=lightscreen
pkgver=2.1
pkgrel=2
pkgdesc='Simple tool to automate the tedious process of saving and cataloging screenshots'
arch=('i686' 'x86_64')
url='http://lightscreen.com.ar/'
depends=('qt5-base'
         'qt5-declarative'
         'qt5-xmlpatterns'
         'qt5-multimedia'
         'qt5-x11extras')
license=('GPL')
source=("lightscreen-$pkgver.tar.gz::https://github.com/ckaiser/Lightscreen/archive/v$pkgver.tar.gz"
        "fix_optionsdialog_include.patch")
sha512sums=('c824970c789c2d3ab3410522a95e773dd34689dc3b144a28e555e4a4e332730be5931d103dcae28292776b69137b33ddc937e98128a909c70580caeeed322e15'
            'c4ea7c0be83b989c1b971eb8b73686ffe52467d0d2e6d21ebb6e700961626612388411d9984df8d0a1c0748196db0ec4f9da125b398d4668e97e0566a1b20606')

prepare() {
  cd "${srcdir}"/"Lightscreen-${pkgver}"
  patch -Np0 -i ../fix_optionsdialog_include.patch
}

build() {
  cd "Lightscreen-$pkgver"
  qmake-qt5
  make
}

package() {
  install -D -m755 "Lightscreen-$pkgver/lightscreen" "$pkgdir/usr/bin/lightscreen" 
}
