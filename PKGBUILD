pkgname=mcg
pkgver=4.0
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.suruatoel.xyz/codes/mcg"
arch=(any)
license=(GPL)
depends=('python-gobject' 'python-dateutil' 'gtk3>=4.18' 'libadwaita>=1.2' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi' 'mpd>=0.21')
makedepends=('meson' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://git.suruatoel.xyz/coderkun/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d6351b4159cbea654a17fecfba16fc3981ea88fef988b7f143986bc79f4b0659')


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
