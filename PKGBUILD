# Maintainer: YOUR_NAME <you@example.com>
pkgname=infodash
pkgver=1.0.2
pkgrel=1
pkgdesc="InfoDash — customizable system/dashboard app"
url="https://github.com/codingncaffeine/InfoDash"
license=(MIT)
arch=(x86_64)
depends=(gtk4 libcurl libxml2 json-glib)
makedepends=(cmake gcc pkgconf json-glib libxml2)
source=("https://github.com/codingncaffeine/InfoDash/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e45ec228596fe1ca04a8e315cf572ef861868fbb51ad578c3b78621485a7f232')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -- -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/InfoDash "${pkgdir}/usr/bin/InfoDash"
  # install other assets if your project provides them (icons, desktop file, etc.)
}

# Notes:
# - Replace codingncaffeine in url and source with your GitHub username/org.
# - Update pkgver/pkgrel on releases and regenerate .SRCINFO before pushing to AUR.
# Maintainer: eldritch <your@email.com>
pkgname=infodash
desc="Modern GTK4 dashboard for RSS, weather, and stocks"
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
url="https://github.com/codingncaffeine/InfoDash"
license=('MIT')
depends=('gtk4' 'json-glib' 'libxml2' 'curl' 'gcc-libs' 'glibc' 'libcurl.so' 'libjson-glib-1.0.so')
makedepends=('cmake' 'git' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codingncaffeine/InfoDash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e45ec228596fe1ca04a8e315cf572ef861868fbb51ad578c3b78621485a7f232')

build() {
  cd "$srcdir/InfoDash-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

package() {
  cd "$srcdir/InfoDash-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  # Install .desktop file if present
  if [[ -f resources/infodash.desktop ]]; then
    install -Dm644 resources/infodash.desktop "$pkgdir/usr/share/applications/infodash.desktop"
  fi
  # Install icon if present
  if [[ -f resources/infodash.png ]]; then
    install -Dm644 resources/infodash.png "$pkgdir/usr/share/pixmaps/infodash.png"
  fi
}
