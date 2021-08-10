# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=stargazer-gmi
pkgver=0.5.0
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL-3.0')
source=("https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'scdoc' 'binutils')
sha256sums=('9758f014c731c145bdf0aad74d47aec7d655f3683395b8d80fda42058ee2f066')

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
