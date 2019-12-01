# Maintainer: Navet56 <evandib@gmail.com>
# Maintainer : Anarchiste <anarchiste@disroot.org>
# Contributor: Navet56 <evandib@gmail.com>

pkgname=opmon-git
pkgver=0.16.r29.gf818d12f
pkgrel=1
license=('GPL')
arch=('x86_64')
pkgdesc="A open source RPG monster fighting game - Git Version"
url="http://opmon-game.ga"
depends=('sfml' 'gcc' 'libstdc++5' 'smpeg')
makedepends=('cmake')
conflicts=('opmon')
source=("git+https://github.com/OpMonTeam/OpMon.git")
md5sums=('SKIP')


pkgver() {
  cd OpMon

  git describe --long --tags | sed 's/^alpha-//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
cd $srcdir/OpMon

cmake  . -DCMAKE_BUILD_TYPE=Release || return 1

make || return 1

}

package()
{

mkdir "${pkgdir}/usr"
mkdir "${pkgdir}/usr/bin"
mkdir "${pkgdir}/usr/local"
mkdir "${pkgdir}/usr/share"
mkdir "${pkgdir}/usr/local/share"
mkdir "${pkgdir}/usr/local/share/OpMon"
mkdir "${pkgdir}/usr/share/applications"

cp ${srcdir}/OpMon/bin/Release/opmon ${pkgdir}/usr/bin/opmon
cp -r ${srcdir}/OpMon/data/* ${pkgdir}/usr/local/share/OpMon
cp ${srcdir}/OpMon/data/OPMon.desktop ${pkgdir}/usr/share/applications/

cd "${srcdir}/OpMon"

}
