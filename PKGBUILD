pkgname=mcg
pkgver=3.2
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
sha256sums=('9c32bb0276345aa69506e41adef0acd0a20ddc5b1f8d2540c128de27bfe556a4')


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
