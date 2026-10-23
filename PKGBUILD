# Maintainer: Guillaume VanderEst <gvanderest@gmail.com>
pkgname=datadog-pup-cli-bin
_binname=pup
pkgver=2.3.0
pkgrel=1
pkgdesc="Datadog API CLI (pup) — OAuth2/API-key CLI for metrics, logs, monitors, traces across 30+ Datadog products (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/DataDog/pup"
license=('Apache-2.0')
provides=('datadog-pup-cli')
# Installs /usr/bin/pup — collides with the unrelated HTML-parser `pup` (ericchiang) in the AUR.
conflicts=('datadog-pup-cli' 'pup' 'pup-bin' 'pup-git')
options=('!strip')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_binname}_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_binname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('dba34c00b2a5c7ce5d8b1cbda8fbe331f6dc2e594e33f8b1404ff5c1d8c43596')
sha256sums_aarch64=('4070b520a27b8da88a819a4caaacece731148d909986d4075101790a0176e096')

package() {
    install -Dm755 "$srcdir/pup" "$pkgdir/usr/bin/pup"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/LICENSE-3rdparty.csv" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-3rdparty.csv"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    "$srcdir/pup" completions bash >"$srcdir/pup.bash" 2>/dev/null \
        && install -Dm644 "$srcdir/pup.bash" "$pkgdir/usr/share/bash-completion/completions/pup"
    "$srcdir/pup" completions zsh >"$srcdir/_pup" 2>/dev/null \
        && install -Dm644 "$srcdir/_pup" "$pkgdir/usr/share/zsh/site-functions/_pup"
    "$srcdir/pup" completions fish >"$srcdir/pup.fish" 2>/dev/null \
        && install -Dm644 "$srcdir/pup.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pup.fish"
}
