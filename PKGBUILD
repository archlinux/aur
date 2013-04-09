# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gti-git
pkgver=v1.0.4.5.g23f5819
pkgrel=1
pkgdesc='A silly git launcher'
arch=('i686' 'x86_64')
url='http://r-wos.org/hacks/gti'
license=('custom')
makedepends=('git')
provides=('gti')
conflicts=('gti')
source=('git://github.com/rwos/gti.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  tail --lines=10 README.md > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 gti "$pkgdir/usr/bin/gti"
}

# vim:set ts=2 sw=2 et:
