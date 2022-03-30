# Maintainer: Latif Sulistyo <latifsulistyo.me@gmail.com>

# shellcheck disable=2034,2154
# shellcheck shell=bash

_pkgname=layout-machi
pkgname=awesome-$_pkgname-git
pkgver=r202.e413822
pkgrel=1
pkgdesc='AwesomeWM manual layout with an interactive editor'

arch=('any')
url='https://github.com/xinhaoyuan/layout-machi'
license=('Apache2.0')
depends=('awesome')
makedepends=('git')
source=('git+https://github.com/xinhaoyuan/layout-machi.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname" || exit 1

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  find . \
    -type f \
    \( -iname '*.lua' -or -iname '*.patch' -or -iname 'icon.png' \) \
    -exec install -Dm644 {} "$pkgdir/usr/share/awesome/lib/$_pkgname/{}" \;
}
