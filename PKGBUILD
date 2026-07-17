# Maintainer: Guillaume VanderEst <gvanderest@gmail.com>
pkgname=datadog-pup-cli-bin
_binname=pup
pkgver=1.6.5
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
sha256sums_x86_64=('398bc844ac7a82dc5ea07b8cb11858675947d9aa6737eb1979d0c41930bd80f8')
sha256sums_aarch64=('5f8ea3b446dba2f58469836f36c9c0acce8635c5e48c158b6ea7983a2ac83bdb')

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
