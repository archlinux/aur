# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=imaginer
_pkgname=Imaginer
pkgver=0.1.3
pkgrel=1
pkgdesc="Imagine with AI"
arch=('any')
url="https://codeberg.org/Imaginer/Imaginer"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-openai' 'python-requests' 'python-pillow' 'gobject-introspection')
makedepends=('meson' 'blueprint-compiler'  )
checkdepends=('appstream-glib')
source=($url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('cbfe19289495d0a01684aac068622c1be290339a5e107f207aac874acbc750ff4e75a53f6894e94e1507a9cd975b18d1f38e203c462d70516bf105951b857c2b')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod 0755 "$pkgdir/usr/bin/$pkgname"
}
