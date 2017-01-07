# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=purrdata-lv2plugin-git
pkgver=25.e00f302
pkgrel=1
pkgdesc="LV2 plugin host for Pd, Purr-Data version"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-lv2plugin/"
depends=('purr-data' 'purrdata-pure' 'pure-lilv')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-lv2plugin")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pd-lv2plugin
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-lv2plugin
     make PD=purr-data || return 1
}

package() {
     cd $srcdir/pd-lv2plugin
     make PD=pd-l2ork prefix=/opt/purr-data DESTDIR=$pkgdir install || return 1
}
