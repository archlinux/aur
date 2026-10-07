# Maintainer: Derek Wisong
#
# Written by scripts/packaging/build_package.py from PKGBUILD.in; the
# placeholders are the version, the crate's description and the tarball's sha256.
# Installs the release's x86_64 Linux tarball, built against glibc 2.28.

pkgname=datui-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Explore tabular data in your terminal: Parquet, CSV, JSON and more"
url="https://derekwisong.github.io/datui"
license=("MIT")
arch=("x86_64")
provides=("datui")
conflicts=("datui")
depends=("glibc" "gcc-libs")
# The tarball ships a symbol table for backtraces; makepkg would strip it and
# split the symbols into a debug package that pacman orphans at once.
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/derekwisong/datui/releases/download/v0.4.2/datui-v0.4.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("1d3320d9a481b5600da2f69bfc13d39c4d3036225a77d4df4fcdb3a83932abaa")

package() {
    install -Dm755 datui -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 man/man5/*.5 -t "$pkgdir/usr/share/man/man5"
    install -Dm644 man/man7/*.7 -t "$pkgdir/usr/share/man/man7"
    install -Dm644 completions/datui.bash "$pkgdir/usr/share/bash-completion/completions/datui"
    install -Dm644 completions/_datui "$pkgdir/usr/share/zsh/site-functions/_datui"
    install -Dm644 completions/datui.fish "$pkgdir/usr/share/fish/vendor_completions.d/datui.fish"
    install -Dm644 scripts/packaging/datui.desktop "$pkgdir/usr/share/applications/datui.desktop"
}
