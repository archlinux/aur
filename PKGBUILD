# Maintainer: Magnus Reid <magnus at msareid dot com>

pkgname=zsh-patina-bin
pkgver=1.12.0
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

sha256sums_x86_64=('0d97077323e09dbfec837f1064a0ce43bcc78d325c2a7ff71c43ea1c38c4b279')
sha256sums_aarch64=('3ec662ee9302ff88b4ce7c7dd7e5ac4e75364a1a4b5c93ed9cdf43799e615d08')
sha256sums_armv7h=('60996c352f8d35ca70d5546730f62ab4c78ec561e0abe8628e00528b0ef58728')
sha256sums_i686=('d9968140a48dfbd59c3c605ef82e38b1b7337919f4ebda6cc6df3377724a1ccc')

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
