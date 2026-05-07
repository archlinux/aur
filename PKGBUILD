# Maintainer: Hamid Noroozi <hamid at validio dot io>
pkgname=evolution-quill
pkgver=0.1.1
pkgrel=1
pkgdesc="AI assistant for Evolution mail — summarize messages and draft replies (Gemini, Claude, OpenAI)"
arch=('x86_64')
url="https://gitlab.com/gnuruzzi/evolution-quill"
license=('LGPL-2.1-or-later')
depends=(
    'evolution>=3.55.1'
    'libsoup3'
    'json-glib'
    'libsecret'
    'gtk3'
)
makedepends=(
    'cmake'
    'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('21e06f0c62723f3af7525806a1bc19b3dcc72095d7fbea5a6568133cd6fe3690')

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
