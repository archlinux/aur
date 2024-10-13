# Maintainer: <teraflops cprieto.ortiz@gmail.com>

pkgname=mpdcovergrabber-git
pkgver=r7.99708e5
pkgrel=1
pkgdesc="user service that fetches album covers for the currently playing song in mpd"
arch=('any')
url="https://gitlab.com/teraflops/mpdcovergrabber"
license=('BSD')
depends=('mpd' 'python-dbus' 'python-requests' 'python-urllib3' 'mpdris2-rs' 'python-dbus-next')
makedepends=('git')
provides=('mpdcovergrabber')
conflicts=('mpdcovergrabber' 'mpdris2' 'mpdris2-git')
source=("git+$url.git")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/mpdcovergrabber"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mpdcovergrabber"
  install -Dm755 "usr/bin/mpdris2_cover.py" "$pkgdir/usr/bin/mpdris2_cover.py"
  install -Dm644 "usr/lib/systemd/user/mpdcovergrabber.service" "$pkgdir/usr/lib/systemd/user/mpdcovergrabber.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

