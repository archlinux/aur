# Maintainer: gnuruzzi <gnuruzzi@users.noreply.gitlab.com>
pkgname=evolution-quill
pkgver=0.3.1
pkgrel=1
pkgdesc="AI assistant for Evolution mail — summarize messages and draft replies (Gemini, Claude, OpenAI)"
arch=('x86_64')
url="https://gitlab.com/gnuruzzi/evolution-quill"
license=('LGPL-2.1-or-later')
depends=(
    'evolution>=3.58'
    'libsoup3'
    'json-glib'
    'libsecret'
    'gtk3'
    # Soname-pinned entries below are what the .so actually links against.
    # Listing them lets AUR helpers (paru/yay) detect when a system upgrade
    # bumps a soname and flag this package for rebuild — without them,
    # Evolution would silently skip the plugin after such a bump.
    'libcamel-1.2.so'
    'libedataserver-1.2.so'
    'libsoup-3.0.so'
    'libjson-glib-1.0.so'
    'libsecret-1.so'
    'libgtk-3.so'
    'libgdk-3.so'
)
makedepends=(
    'cmake'
    'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('ccdd290c1a9082e2b308a113879b3a977d35e10e04b592c78c045d6f7536f8a3')

build() {
    cmake -B build -S "$pkgname-v$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSTEM_INSTALL=ON \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
