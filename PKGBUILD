# Maintainer: bonkmaykr <bonkmaykr@screwgravity.net>
# Contributor: Wirlaburla <wirlaburla@worlio.com>
pkgname=firestar
pkgver=1.3.1
pkgrel=1
pkgdesc='The mod manager for WipEout 2048'

# WINE cannot translate our Windows backend tools to ARM/i386.
arch=('x86_64')
url=https://screwgravity.net/firestar/
license=('GPL-3.0-or-later')
depends=('wine' 'jdk17-openjdk')
makedepends=('gradle')
provides=('firestar-git')
conflicts=('firestar-git')

prepare() {
cd $srcdir
rm -rf firestar/
git clone --single-branch --branch tetsuo-1.3.1 https://git.worlio.com/bonkmaykr/firestar
}

build() {
cd firestar
gradle build
}

package() {
cd firestar
mkdir -p $pkgdir/usr/bin/
mkdir -p $pkgdir/usr/share/java/firestar/
cp installer/unix/usr/bin/firestar $pkgdir/usr/bin/firestar
chmod +x $pkgdir/usr/bin/firestar
cp firestar/build/libs/firestar.jar $pkgdir/usr/share/java/firestar/firestar.jar
}
