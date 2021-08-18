# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-autosubsync-git
_pkgname=${pkgname%-git}
pkgver=r100.ea6d616
pkgrel=1
pkgdesc='Automatic subtitle synchronization script for mpv media player'
arch=('any')
url='https://github.com/joaquintorres/autosubsync-mpv'
license=('MIT')
depends=(
  'mpv>=0.33'
  'alass'
)
optdepends=('python-ffsubsync: yet another backend')
makedepends=('git')
provides=('mpv-autosubsync')
source=(
  "$_pkgname::git+$url"
  'autosubsync.conf'
)
install="$pkgname.install"
sha256sums=(
  'SKIP'
  '7703a53e75719afd51a98f3ba1eaaeef6243ce433ffba8be89dce401064d6161'
)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 autosubsync.lua \
    -t "$pkgdir"/usr/share/mpv/scripts

  install -Dm644 "$srcdir/${source[1]}" \
    -t "$pkgdir"/usr/share/doc/mpv/script-opts/

  install -Dm644 LICENSE \
    -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
