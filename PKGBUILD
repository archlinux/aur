# Maintainer: tuberry

_srcname=mingju
pkgname=fortune-mod-mingju
pkgver=1.0.0
pkgrel=1
pkgdesc="Chinese mingju for fortune-mod"
url="https://github.com/xuchunyang/${_srcname}"
license=("CCPL")
depends=('fortune-mod')
makedepends=('git' 'fortune-mod')
groups=('fortune-mods')
source=("git+${url}")
md5sums=('SKIP')
arch=('any')

build() {
  cd ${_srcname}
  sed -e 's/"},{"/\n%\n/g; s/contents":"//g; s/","source":"/\n ──── /g; s/]/\n%\n/' < ${_srcname}.json | tr -d '"{}[' > ${_srcname}
  strfile ${_srcname} ${_srcname}.dat
}

package(){
  cd ${_srcname}
  install -dm755 ${pkgdir}/usr/share/fortune
  install -Dm644 ${_srcname} ${_srcname}.dat ${pkgdir}/usr/share/fortune
}
