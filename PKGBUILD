# Maintainer: a821 at mail de
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych at mail dot com>
# Contributor: Jesper Jensen <delusionallogic at gmail dot com>

_pkgname=iniparser
pkgname=iniparser-git
pkgver=4.1.r80.rgf00e027
pkgrel=1
epoch=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64')
url="https://github.com/ndevilla/iniparser"
license=('MIT')
depends=('glibc')
makedepends=('git' 'chrpath')
provides=("${_pkgname}" 'libiniparser.so')
conflicts=("${_pkgname}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --tags | sed 's/^v//;s/-/.r/g;s/-/.g/'
}

build() {
  make -C $_pkgname
}

package() {
  cd "$_pkgname"
  install -Dm644 src/{iniparser.h,dictionary.h} -t  "${pkgdir}/usr/include/"
  install -Dm755 libiniparser.so.1 -t "${pkgdir}/usr/lib"
  ln -sf "libiniparser.so.1" "${pkgdir}/usr/lib/libiniparser.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chrpath -d "${pkgdir}"/usr/lib/libiniparser.so
}
