# Maintainer: Magnus Reid <magnus at msareid dot com>

pkgname=zsh-patina-bin
pkgver=1.7.0
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

sha256sums_x86_64=('e17e31e607f50f334016604280016d665555c07b2a501d7dcef2d61d07ac9217')
sha256sums_aarch64=('7d222e54bc0d57fd1f09f12ec1e1a4b245e752bc099b9971369b00038d8a0b16')
sha256sums_armv7h=('6420db8b1f7498a280c76d1b8f8b35dc79bfe1f6a773f52bd5113a3cb71aa2a3')
sha256sums_i686=('7728970aedef3c6033b63694e27d77141224c82696ac239f961097dc60433627')

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
