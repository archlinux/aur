# Maintainer: David Beley <dbeley@protonmail.com>
pkgname=mpdscrobble-git
pkgver=0.3.1
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="A simple Last.fm scrobbler for MPD."
arch=('any')
url="https://github.com/dbeley/${pkgname%-git}"
license=('MIT')
depends=(
        'python'
        'python-setuptools'
        'python-mpd2'
        'python-pylast'
        'python-httpx'
        )
source=("git+https://github.com/dbeley/${pkgname%-git}")
md5sums=("SKIP")

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 systemd-service/mpdscrobble.service "$pkgdir/usr/lib/systemd/user/${pkgname%-git}.service"
}
