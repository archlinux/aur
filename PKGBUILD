# Maintainer: luke bonham <dada [at] archlinux [dot] info>

pkgname=lain-git
pkgver=1278.a04895f
pkgrel=1
pkgdesc="Layouts, Utilities and Widgets for Awesome WM"
arch=('any')
url="https://github.com/copycat-killer/lain"
license=('GPL2')
depends=('awesome')
optdepends=('alsa-utils: for ALSA volume widgets'
            'curl: for widgets accessing network resources'
            'imagemagick: for mpd album art notifications')
makedepends=('git')
provides=('lain')
conflicts=('lain')
source=("git://github.com/copycat-killer/lain.git")
md5sums=('SKIP')

pkgver() {
  cd lain
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/awesome/lib/lain"
  rm -r lain/{wiki,.git*}
  cp -a lain "$pkgdir/usr/share/awesome/lib/"

  # Fix permissions
  find "$pkgdir" -type f ! -path "*/scripts/*" -print0 | xargs -0 chmod -R 644
}
