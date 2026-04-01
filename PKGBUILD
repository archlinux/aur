# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=cachyos-ananicy-rules-git
_gitname=ananicy-rules
pkgver=20260326.r1990.g40e7b0d
pkgrel=1
groups=('cachyos')
arch=('any')
license=('GPL-3.0-only')
pkgdesc='CachyOS - ananicy-rules'
url='https://github.com/CachyOS/ananicy-rules'
depends=('ananicy-cpp')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')
replaces=('ananicy-rules-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=(etc/ananicy.d/ananicy.conf)

pkgver() {
  cd $_gitname
  echo "$(git show --format='%cI' -q master | sed 's/T.*//g;s/-//g').r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_gitname
  rm -f README.md
}

package() {
  cd $_gitname
  install -d "$pkgdir/etc/ananicy.d"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -rf $srcdir/$_gitname/* "$pkgdir/etc/ananicy.d"
}

# vim: sw=2 ts=2 et:
