pkgname=mcg
pkgver=3.2.1
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.suruatoel.xyz/codes/mcg"
arch=(any)
license=(GPL)
depends=('python-gobject' 'python-dateutil' 'gtk3>=3.22' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi' 'mpd>=0.21')
makedepends=('meson' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://gitlab.com/coderkun/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('dfa0adca69a5dcd1869dca5c05528eaa57963d8037dd54c7f6e573d0521b56c6')


build() {
  arch-meson ${pkgname}-v${pkgver} build
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
