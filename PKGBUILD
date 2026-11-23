# Maintainer: Guillaume VanderEst <gvanderest@gmail.com>
pkgname=datadog-pup-cli-bin
_binname=pup
pkgver=2.6.1
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
sha256sums_x86_64=('784a862178cbb60ea1522acf5e459db199e7da763c46915641e0a5488cdb6f9c')
sha256sums_aarch64=('12f929447ea809925a5b7c9e82b645c203a99a0e06b328b44aa463e4242ef629')

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
