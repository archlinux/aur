# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-unstable-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="moshpit client with post-quantum support — SSH and Mosh inspired remote terminal client (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit')
conflicts=('moshpit' 'moshpit-bin')
replaces=('moshpit-bin')
depends=('moshpit-keygen')
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp.tar.gz")
source_x86_64=("mp-unstable-x86_64::${_base}/mp-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mp-unstable-aarch64::${_base}/mp-unstable-aarch64-unknown-linux-musl")
sha256sums=('25ff5d9c3ae7f663e134e8f76e7bd1da6bfb14694883ebc16fdf4f3319416b20')
sha256sums_x86_64=('18f3493dd2e0c7a33a8c09fe4141ad79529b219aa354826642888ac0494adac9')
sha256sums_aarch64=('1f99e87d6c675ce7ecd5e1d9be0c0fcd52ac83ba7e71fc6f770ba0cdb613d74d')

package() {
    install -Dm755 "mp-unstable-${CARCH}" "$pkgdir/usr/bin/mp"

    # Man page
    install -Dm644 mp/mp.1 "$pkgdir/usr/share/man/man1/mp.1"

    # Shell completions
    install -Dm644 mp/mp.bash \
        "$pkgdir/usr/share/bash-completion/completions/mp"
    install -Dm644 mp/_mp \
        "$pkgdir/usr/share/zsh/site-functions/_mp"
    install -Dm644 mp/mp.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mp.fish"

    # Example config
    install -Dm644 mp/moshpit.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/moshpit.toml.example"

    # Licenses
    install -Dm644 mp/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mp/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
