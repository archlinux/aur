# Maintainer: Petteri Tolonen <petteri[dot]tolonen[at]gmail[dot]com>

pkgname=jugglinglab
pkgver=0.6.2
pkgrel=4
pkgdesc="An application for creating and animating juggling patterns."
arch=('any')
url="http://jugglinglab.sourceforge.net/"
license=('GPL')
depends=('bash' 'java-environment')
makedepends=('gzip' 'sed')
source=(http://downloads.sourceforge.net/project/jugglinglab/Juggling%20Lab/JugglingLab-${pkgver}_other.tar.gz)
sha256sums=('ad0e4b9e4d11729e15a34873caaccb43ca8a538f598b4b4c3e69b464f523a459')
package() {

   cd $startdir/src/JugglingLab
   mkdir -p -m755 $pkgdir/usr/share/jugglinglab/patterns
   mkdir -p $pkgdir/usr/bin
   cd $srcdir/JugglingLab/
   install -m644 bin/JugglingLab.jar $pkgdir/usr/share/jugglinglab/
   sed -i 's|bin/JugglingLab.jar|/usr/share/jugglinglab/JugglingLab.jar|g' ./JugglingLab
   sed -i 's|JugglingLab.jar|/usr/share/jugglinglab/JugglingLab.jar|;1s|#!/bin/csh -f|#!/bin/sh|' ./bin/j2
   install -m755 JugglingLab $pkgdir/usr/bin/jugglinglab
   install -m755 bin/j2 $pkgdir/usr/bin/jugglinglab-generator
   install -m644 COPYING.txt $pkgdir/usr/share/jugglinglab/
   install -m644 README.html $pkgdir/usr/share/jugglinglab/
   install -m644 patterns/* $pkgdir/usr/share/jugglinglab/patterns/

}
