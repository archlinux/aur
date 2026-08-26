# Maintainer: Magnus Reid <magnus at msareid dot com>

pkgname=zsh-patina-bin
pkgver=1.10.0
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

sha256sums_x86_64=('316e3970a21a97dd6f84983ebd4b2979692868ed2d2327092563bfbdc3b9e4ec')
sha256sums_aarch64=('369d2b74953c30900ca5d9a1f81030a07bfcb418ea1034a78daa4cc687541cf4')
sha256sums_armv7h=('5fcd79fa16e5a23babffc6af3d359b8469dd22a50ac652c258dbb9bc9aab2338')
sha256sums_i686=('dc72f01d44a68e709e2069962bbcb7a6e481f8a08b00347056dc34cc69ac2c56')

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
