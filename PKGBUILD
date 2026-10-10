# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=7.0.3
_pkgdir=cpeditor-$pkgver-full-source
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL-3.0-or-later')
depends=(
    'qt5-base'
    'qt5-svg'
    'syntax-highlighting5'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'python3'
    'qt5-tools'
)
optdepends=(
    'cf-tool: submit to Codeforces'
    'clang: C++ format and language server'
    'java-environment: compile Java'
    'java-runtime: execute Java'
    'python: execute Python'
    'wakatime: track coding stats'
)
source=("https://github.com/cpeditor/$pkgname/releases/download/$pkgver/cpeditor-$pkgver-full-source.tar.gz")
sha256sums=('8f88d7ab0b22b70f7843352339c2e143fa6e203904a1401a353dfed450618491')

build() {
    cd "$_pkgdir"
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPORTABLE_VERSION=Off -DCMAKE_BUILD_TYPE=Release -GNinja
    cmake --build build
}

package() {
    cd "$_pkgdir/build"
    DESTDIR="$pkgdir/" ninja install
}
