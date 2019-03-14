# Maintainer: Peter Cai <peter@typeblog.net>

_pkgname=kwin
_pkgver=5.15.3
pkgname=kwin-aurorae-optional-titlebar
pkgver=${_pkgver}_1
pkgrel=1
pkgdesc='A hacked version of the KWin theme engine Aurorae that allows skipping title bars for a user-defined set of applications'
arch=(x86_64)
url='https://git.angry.im/PeterCxy/kwin-aurorae-optional-titlebar'
license=(LGPL)
depends=("kwin>=$_pkgver")
makedepends=(extra-cmake-modules qt5-tools)
source=(
  "https://download.kde.org/stable/plasma/$_pkgver/$_pkgname-$_pkgver.tar.xz"
  "kwin-aurorae-optional-titlebar.patch"
  "kwin-aurorae-optional-titlebar.sh"
)
md5sums=('2dd5ecd4ecb32be77178d8ac660b94fe'
         'b314f47c73308e1440344288a75f7c93'
         '854459e61a223321d674299a97ec082e')

prepare() {
  mkdir -p build
  cd $_pkgname-$_pkgver
  patch -p1 < ../kwin-aurorae-optional-titlebar.patch
}

build() {
  cd build
  cmake ../$_pkgname-$_pkgver
  make kwin5_aurorae
}

package() {
  dstdir=$pkgdir/usr/lib/kwin-aurorae-optional-titlebar/org.kde.kdecoration2
  mkdir -p $dstdir
  cp build/bin/org.kde.kdecoration2/kwin5_aurorae.so $dstdir
  profdir=$pkgdir/etc/profile.d
  mkdir -p $profdir
  cp kwin-aurorae-optional-titlebar.sh $profdir
}

