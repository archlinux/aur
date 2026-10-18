# Maintainer: Magnus Reid <magnus at msareid dot com>

pkgname=zsh-patina-bin
pkgver=1.11.0
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/michel-kraemer/zsh-patina'
license=('MIT')
depends=('libgcc')
conflicts=('zsh-patina')
provides=('zsh-patina')
source_x86_64=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
source_armv7h=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
source_i686=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('ca08de211f60aaaf80d3b440526a5b9e225e3a567a9952c4ad70aef427de620d')
sha256sums_aarch64=('a93996194289eee9594ff81d88aee7903efa6d8e80d14a798f83774ce586df47')
sha256sums_armv7h=('2cb576f154c7d5619cd2b76bf6e503cfe3c56ecf6d37f4a7498c387690c33bce')
sha256sums_i686=('d7b18cc8e5db3fe0c2904875a5efffe3a97e1e35287cdde58dc55f9aba9b13d6')

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
