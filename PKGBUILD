# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.10.3
_pkgdir=cpeditor-$pkgver-full-source
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=(
    "cmake"
    "git"
    "ninja"
    "python3"
    "qt5-tools"
)
optdepends=(
    'cf-tool: submit to Codeforces'
    'clang: C++ format and language server'
    'java-environment: compile Java'
    'java-runtime: execute Java'
    'python: execute Python'
    'wakatime: track coding stats'
)
conflicts=("cpeditor-git")
source=("https://github.com/cpeditor/$pkgname/releases/download/$pkgver/cpeditor-$pkgver-full-source.tar.gz")
sha256sums=('b7c1512904ed9bc23c2a622f8512cf6fb4055ce102d5f9db5fc927b6fcb46a64')

build() {
    cd "$_pkgdir"
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPORTABLE_VERSION=Off -DCMAKE_BUILD_TYPE=Release -GNinja
    cmake --build build
}

package() {
    cd "$_pkgdir/build"
    DESTDIR="$pkgdir/" ninja install
}
