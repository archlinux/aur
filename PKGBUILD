# Maintainer: Emanuel <emanuelvserpa@gmail.com>
pkgname=powerctl-git
_pkgname=${pkgname%-git}
pkgver=r27.d3ae1ca
pkgrel=1
pkgdesc='A simple command line utility to control power states on Linux, i.e. to suspend or hibernate the system.'
url='https://sr.ht/~sircmpwn/powerctl'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(hare-git)
conflicts=()
provides=(powerctl)
source=("git+https://git.sr.ht/~sircmpwn/powerctl")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 "powerctl" "$pkgdir/usr/bin/powerctl"
  chmod u+s "$pkgdir/usr/bin/powerctl"
  install -Dm644 "powerctl.8" "$pkgdir/usr/share/man/man8/powerctl.8"
}

