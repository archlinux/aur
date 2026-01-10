pkgname=mcg
pkgver=4.0.2
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.suruatoel.xyz/codes/mcg"
arch=(any)
license=('GPL-3.0-or-later')
depends=('python-gobject' 'python-dateutil' 'gtk4>=4.12' 'libadwaita>=1.2' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi' 'mpd>=0.21')
makedepends=('meson' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://git.suruatoel.xyz/coderkun/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('dbbd8b9a1c8cbd2dc122ff517a9e6e82976efeb15f85b0627184ada39ef8d0e8')


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
