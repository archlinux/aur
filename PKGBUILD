# Maintainer: Magnus Reid <magnus at msareid dot com>

pkgname=zsh-patina-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/michel-kraemer/zsh-patina'
license=('MIT')
depends=('libgcc')
conflicts=('zsh-patina-git' 'zsh-patina')
source_x86_64=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
source_armv7h=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
source_i686=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('5227a155b29e6a51a468fd7b76267cc6469404c499ad1e84d116f55c573ebb5e')
sha256sums_aarch64=('74132d5d3fdc9784f9180a9d7fcc250d101a08c7b22e08b099953587c9657262')
sha256sums_armv7h=('e230f120004bf0c45b12e3a22302a3f4a44a448b9ad48e9c51c62c2834d9dc9c')
sha256sums_i686=('aa6c06456331bce9219abb46c5fc6a7716585c75195b63ceee4bc66892f5b03d')

package() {
    local _srcdir

    if [[ $CARCH == armv7h ]]; then
        # fix bad naming of armv7h folder
        _srcdir="$srcdir/zsh-patina-v$pkgver-arm-unknown-linux-gnueabihf"
    else
        _srcdir="$srcdir/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu"
    fi

    install -Dm755 "$_srcdir/zsh-patina" \
        "$pkgdir/usr/bin/zsh-patina"
    install -Dm644 "$_srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_srcdir/completion/_zsh-patina" \
        "$pkgdir/usr/share/zsh/site-functions/_zsh-patina"
}
