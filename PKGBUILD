# Maintainer: lmartinez-mirror
pkgname=mpv-sponsorblock-git
_pkgname=${pkgname%-git}
pkgver=r52.aea7a77
pkgrel=2
pkgdesc="A script to skip sponsored segments of YouTube videos"
arch=('any')
url="https://github.com/po5/mpv_sponsorblock"
license=('GPL3')
groups=('mpv-plugins')
depends=('mpv' 'python3')
makedepends=('git')
provides=('mpv-sponsorblock')
install=mpv-sponsorblock.install
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm 755 sponsorblock.lua -t "$pkgdir/usr/lib/mpv/$pkgname/"
  find sponsorblock_shared -type f -exec install -Dm 755 '{}' \
    -t "$pkgdir/usr/lib/mpv/$pkgname/" \;
}

