# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=meteo
pkgver=0.9.9.3
pkgrel=3
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('x86_64')
url="https://gitlab.com/bitseater/meteo"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream')
conflicts=('meteo-gtk')
_commit=5d8501911faed913036609e8ae7dfb2b35d76f4a  # tags/0.9.9.3^0
source=("git+https://gitlab.com/bitseater/meteo.git#commit=${_commit}?signed")
sha256sums=('4bcd60794f3d2752abbf30a7e3554a2bd95be2c91d92c0bb2153a5639f8949cf')
validpgpkeys=('900E41F44EFF4B6D696EB80AE6BDC743AED36483') # Carlos Suárez <bitseater@gmail.com>

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/com.gitlab.bitseater.meteo "$pkgdir/usr/bin/$pkgname"
}
