# Maintainer: teraflops <cprieto.ortiz@gmail.com>

pkgname=mpdcovergrabber-git
pkgver=0.r7.99708e5
pkgrel=1
pkgdesc="A user service that fetches album covers for the currently playing song in MPD and saves them to the music directory"
arch=('any')
url="https://gitlab.com/teraflops/mpdcovergrabber"
license=('BSD')
depends=('mpd' 'python-requests' 'python-dbus-next' 'mpdris2-rs')
makedepends=('git')
provides=('mpdcovergrabber')
conflicts=('mpdcovergrabber')
source=("git+$url.git")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "usr/bin/mpdris2_cover.py" "$pkgdir/usr/bin/mpdris2_cover.py"
  install -Dm644 "usr/lib/systemd/user/mpdcovergrabber.service" "$pkgdir/usr/lib/systemd/user/mpdcovergrabber.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

