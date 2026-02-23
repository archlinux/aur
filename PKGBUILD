# Maintainer: Aida van de Wetering <aida@osphire.com>
pkgname=kodi-remote-start-daemon
pkgver=0.1.0
pkgrel=1
pkgdesc="Daemon for starting kodi from remote control apps like KORE, Kodi Remote, or Yatse"
arch=('any')
depends=('kodi')
optdepends=('kodi-standalone-service: launching standalone modes')
url="https://codeberg.org/aidavdw/kodi-remote-start-daemon"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git')
source=(
    "$pkgname::git+https://codeberg.org/aidavdw/kodi-remote-start-daemon.git"
    "kodi-remote-start-daemon@.service"
    "kodi-remote-start-daemon-standalone-gbm@.service"
    "kodi-remote-start-daemon-standalone-wayland@.service"
    "kodi-remote-start-daemon-standalone-x11@.service"
)
#TODO: add checksums
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

pkgver() {
    cat "$srcdir/$pkgname/pyproject.toml" | grep version | cut -d "\"" -f2
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "$srcdir/$pkgname/kodi-remote-start-daemon.py" \
        "$pkgdir/usr/bin/kodi-remote-start-daemon"

    install -Dm644 "$srcdir/kodi-remote-start-daemon@.service" \
        "$pkgdir/usr/lib/systemd/system/kodi-remote-start-daemon@.service"

    install -Dm644 "$srcdir/kodi-remote-start-daemon-standalone-gbm@.service" \
        "$pkgdir/usr/lib/systemd/system/kodi-remote-start-daemon-standalone-gbm@.service"

    install -Dm644 "$srcdir/kodi-remote-start-daemon-standalone-wayland@.service" \
        "$pkgdir/usr/lib/systemd/system/kodi-remote-start-daemon-standalone-wayland@.service"

    install -Dm644 "$srcdir/kodi-remote-start-daemon-standalone-x11@.service" \
        "$pkgdir/usr/lib/systemd/system/kodi-remote-start-daemon-standalone-x11@.service"

}
