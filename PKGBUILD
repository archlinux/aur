# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

pkgname=komikku-git
pkgver=1.7.0.r2.gc5ee2a72
pkgrel=1
pkgdesc='Online/offline Manga reader for GNOME with PinePhone and Librem 5 Support'
arch=(any)
url=https://gitlab.com/valos/${pkgname%-git}
license=(GPL3)
depends=('libadwaita' 'python-beautifulsoup4' 'python-brotli' 'python-cairo' 'python-cffi' 'python-cloudscraper' 'python-dateparser' 'python-emoji' 'python-gobject' 'python-keyring' 'python-lxml' 'python-magic' 'python-natsort' 'python-pillow' 'python-pure-protobuf' 'python-unidecode' 'python-wheel' 'python-rarfile' 'webkit2gtk' 'webkit2gtk-5.0')
makedepends=('git' 'gobject-introspection' 'meson')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  ninja -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
