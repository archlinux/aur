# Maintainer: goodmind <andwebar@gmail.com>
pkgname=infornography-git
pkgver=0.5.r0.g718c351
pkgrel=1
pkgdesc="Racket script to show system information, lightweight alternative to screenfetch."
arch=('any')
url="https://github.com/goodmind/infornography"
license=('MIT')
depends=('racket')
makedepends=('git')
source=("$pkgname::git+https://github.com/goodmind/infornography.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  sed -i "s/OS: Linux/OS: Arch Linux/g" infornography.rkt
}

package() {
  cd $pkgname
  install -D -m755 "infornography.rkt" "$pkgdir"/usr/bin/infornography
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
