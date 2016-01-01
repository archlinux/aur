# Maintainer: Leela Ross <leela@leela-ross.com>
pkgname=znc-mailnotify-git
pkgver=r87.f89ebda 
pkgrel=1
pkgdesc="ZNC mailnotify is a module for ZNC that will send notifications 
to a specified mailbox"
arch=('i686' 'x86_64')
url="https://github.com/milaq/znc-mailnotify"
license=('MIT')
depends=('znc')
source=("git+https://github.com/milaq/znc-mailnotify.git")
sha256sums=('SKIP')

pkgver() {
  cd znc-mailnotify
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd znc-mailnotify
  znc-buildmod mailnotify.cpp
}

package() {
  cd znc-mailnotify
  install -Dm755 mailnotify.so "$pkgdir/usr/lib/znc/mailnotify.so"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

