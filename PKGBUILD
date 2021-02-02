# Maintainer: Adrian Cochrane <alcinnz@lavabit.com>
pkgname=odysseus
pkgver=1.7.2
pkgrel=1
pkgdesc="Web browser for the open and decentralized web."
url="https://odysseus.adrian.geek.nz"
license=('GPL')
arch=('i686' 'x86_64')
depends=(
    'gtk3'
    'granite'
    'webkit2gtk'
    'json-glib'
    'libsoup'
    'sqlite'
    'appstream'
    'gcr'
    'gettext'
)
makedepends=(
    'meson'
    'vala'
)
optdepends=(
    'archlinux-appstream-data: compatible app recommendations for hyperlinks'
    'html-xml-utils: webfeed autodiscovery'
)
source=(https://github.com/alcinnz/Odysseus/archive/$pkgver.tar.gz)
md5sums=(5151ab0ae2a24fb098ef22dcec30b385) #autofill using updpkgsums

build() {
  cd "Odysseus-$pkgver"

  [ -d build ] && rm -rf build
  meson build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "Odysseus-$pkgver"

  DESTDIR="$pkgdir" ninja -C build install
}
