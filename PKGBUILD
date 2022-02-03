# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=stargazer-gmi
pkgver=0.6.1
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL-3.0')
source=("https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'scdoc' 'binutils')
sha256sums=('7e3ed7dd34bf58a2ffaf2c672ce51de0d0b63eb9755c61a8327b60c2c5b11bb2')

build() {
    tar -xf $pkgver.tar.gz
    cd "$srcdir/stargazer-$pkgver"
    ./scripts/build
}

package() {
    cd "$srcdir/stargazer-$pkgver"
    source ./scripts/install --prefix="$pkgdir/usr" \
        --sysconfdir="$pkgdir/etc" \
        --bashdir="$pkgdir/usr/share/bash-completion/completions" \
        --zshdir="$pkgdir/usr/share/zsh/site-functions" \
        --fishdir="$pkgdir/usr/share/fish/vendor_completions.d"
}
