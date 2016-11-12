# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=selene-git
_pkgname=Selene
pkgver=0.4+126+g856b15e
pkgrel=1
pkgdesc='Simple C++11 friendly header-only bindings to Lua'
url='https://github.com/jeremyong/Selene'
arch=('any')
license=('zlib')
depends=('lua')
checkdepends=('cmake')
makedepends=('git')
provides=('selene')
conflicts=('selene')
source=(${pkgname}::git+https://github.com/jeremyong/${_pkgname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v?(.+)|\1|g'
}

prepare() {
  cd ${pkgname}
  mkdir build
}

build() {
  cd ${pkgname}/build
  cmake ..
  make
}

check() {
  cd ${pkgname}/build
  ./test_runner
}

package() {
  cd ${pkgname}
  install -d "${pkgdir}/usr/share"
  cp -r include "${pkgdir}/usr/share"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
