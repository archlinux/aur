# Maintainer: Tim Pearson <ttpears@gmail.com>
pkgname=tmux-tad
_pkgname=tad
pkgver=0.6.0
pkgrel=1
pkgdesc="Tmux session and group manager with a native TUI dashboard (prebuilt binary)"
arch=('x86_64')
url="https://github.com/ttpears/tad"
license=('MIT')
depends=('tmux' 'gcc-libs' 'glibc')
# Installs /usr/bin/tad — conflicts with unrelated AUR packages:
#   `tad-bin` (CSV viewer) and `tad` (C++ array library).
# `tmux-tad-bin` is the legacy name for this same package; `provides`
# lets anyone still holding the old install upgrade cleanly.
# `tmux-tad-git` is reserved for a future from-source variant.
provides=("tmux-tad-bin=$pkgver")
conflicts=('tad-bin' 'tad' 'tmux-tad-bin' 'tmux-tad-git')
source=(
    "$_pkgname-$pkgver::$url/releases/download/v$pkgver/tad-v$pkgver-x86_64-linux"
    "tad.bash-$pkgver::$url/releases/download/v$pkgver/tad.bash"
    "_tad-$pkgver::$url/releases/download/v$pkgver/_tad"
    "groups.yaml.example-$pkgver::$url/releases/download/v$pkgver/groups.yaml.example"
    "config.yaml.example-$pkgver::$url/releases/download/v$pkgver/config.yaml.example"
    "LICENSE-$pkgver::$url/releases/download/v$pkgver/LICENSE"
)
# Regenerate after each release with:
#   curl -sL https://github.com/ttpears/tad/releases/download/v$pkgver/SHA256SUMS
# and paste the binary, tad.bash, _tad, groups.example, config.example, LICENSE
# hashes (in source[] order) below.
sha256sums=(
    '5a25f357f153a019cfa2779a9f0fb30ed9fd508e68860953efbcbe2e76c7a4d3'
    '8f8f2b70da4f3477f54f4da7d4c6867eed4dc3afe17a6fc2d12b61feaafa597c'
    'f9f4e5adb383c4263c1b0b9db5b4b20d7c97850dd3fb8d6e1c55140c84862d00'
    '5a20954483b4d58685a7206afb612f215ff95a950adeeaeae46fa0b8ae5355f3'
    '3bfa01285de93ccc6ea867cada2378243dfb01fd380fd4d672788a50f755852d'
    '0d84b0097b77a15e0900f62cc494a152dd6f5d5eb005ccb3f717309ce5630d46'
)

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver" \
        "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/tad.bash-$pkgver" \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$srcdir/_tad-$pkgver" \
        "$pkgdir/usr/share/zsh/site-functions/_tad"
    install -Dm644 "$srcdir/groups.yaml.example-$pkgver" \
        "$pkgdir/usr/share/doc/$pkgname/groups.yaml.example"
    install -Dm644 "$srcdir/config.yaml.example-$pkgver" \
        "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"
    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
