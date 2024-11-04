# Maintainer: Squalou Jenkins <squalou.jenkins@gmail.com>
# 
# Contributor: Pig Monkey <pm@pig-monkey.com>
# Contributor: portix <portix at gmx.net>

pkgname=srandrd-git
pkgver=v0.6.3.r0.g640f3e3
pkgrel=1
pkgdesc="Simple randr daemon that reacts to monitor hotplug events" 
arch=('i686' 'x86_64')
url="https://github.com/jceb/srandrd"
license=('custom:MIT/X')
depends=('libxrandr' 'libxinerama' 'libx11')
provides=('srandrd')
conflicts=('srandrd')
makedepends=('git')
source=("${pkgname%-git}::git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd "$srcdir/${pkgname%-git}"
  make
}
package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
