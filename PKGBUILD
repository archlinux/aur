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
source=(
    "$pkgname::https://codeberg.org/aidavdw/kodi-remote-start-daemon/archive/v0.1.0.tar.gz"
    "kodi-remote-start-daemon@.service"
    "kodi-remote-start-daemon-standalone-gbm@.service"
    "kodi-remote-start-daemon-standalone-wayland@.service"
    "kodi-remote-start-daemon-standalone-x11@.service"
)

sha256sums=('ae7d3aec5a1f507392fa4b708f513dab58dd692270dcb76a2f8241cd63955242'
    'ab41a0b83d920817a4d3589706e27c75835b782472016bed64d6f38a80f9505a'
    '06960724390b6c2c7b76406e42b03b38fa902ef97b54340ec1926f4fc3b4c982'
    'ce0f681562a9ae13342a1b85bfb0be6d5f1da870fea2c3835126eb5ce8608963'
    'ebc4e398ebe57c369f9598f9c0690211064542a178894220cd87384601306b00')

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
