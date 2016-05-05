# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=zzuf-git
pkgver=0.15.680.14138cd
pkgrel=1
pkgdesc="Transparent application input fuzzer"
url='https://github.com/samhocevar/zzuf'
arch=('i686' 'x86_64')
license=('custom:WTF')
depends=('glibc')
makedepends=('git')
provides=('zzuf')
conflicts=('zzuf')
source=(${pkgname}::git+https://github.com/samhocevar/zzuf)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}
  make check
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
