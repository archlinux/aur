# Maintainer: el gato <gato.mega.mp3@gmail.com>
pkgname=winamp-mpris
pkgver=0.1.1
pkgrel=1
pkgdesc="MPRIS bridge for Winamp running under Wine (exposes a playerctl-compatible MPRIS endpoint)"
arch=('any')
url="https://github.com/elgatolinux/winamp-mpris"
license=('MIT')
depends=('python' 'wine' 'playerctl' 'python-dbus-next')
provides=('winamp-mpris')
conflicts=()
replaces=()
source=(git+${url}.git#branch=main)

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"

}

package() {
  cd "${srcdir}/${pkgname}"
  pwd
  install -Dm755 winamp-mpris.py "$pkgdir/usr/bin/winamp-mpris"

  install -Dm644 winamp-mpris.service "$pkgdir/usr/lib/systemd/user/winamp-mpris.service"
  # Install clamp.exe to a read-only system location so Wine can reference it via Z: drive
  install -Dm644 clamp.exe "$pkgdir/usr/share/winamp-mpris/clamp.exe"



}

