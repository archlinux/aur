# Contributor: lmartinez-mirror
pkgname=mpv-sponsorblock-minimal-git
_pkgname=${pkgname%-git}
pkgver=r44.fc0db1f
pkgrel=1
pkgdesc="A minimal script to skip sponsored segments of YouTube videos"
arch=('any')
url="https://codeberg.org/jouni/mpv_sponsorblock_minimal"
license=('GPL-3.0-only')
depends=('mpv' 'curl')
makedepends=('git')
provides=('mpv-sponsorblock')
conflicts=('mpv-sponsorblock')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
backup=('etc/mpv/script-opts/sponsorblock_minimal.conf')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 sponsorblock_minimal.lua -t "$pkgdir/etc/mpv/scripts/"
  install -Dm644 sponsorblock_minimal.conf -t "$pkgdir/etc/mpv/script-opts/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

