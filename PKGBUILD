pkgname=mcg
pkgver=4.0.1
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.suruatoel.xyz/codes/mcg"
arch=(any)
license=(GPL)
depends=('python-gobject' 'python-dateutil' 'gtk4>=4.12' 'libadwaita>=1.2' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi' 'mpd>=0.21')
makedepends=('meson' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://git.suruatoel.xyz/coderkun/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('92ce0459eb5524f9847c2d5f06b5db9bf6d5869da054959894ccff949addd5ee')


prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
