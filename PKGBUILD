# Maintainer: Tim Visee <tim@visee.me>
# Contributor: Ariel AxionL <i at axionl dot me>
#
# This PKGBUILD is managed externally, and is automatically updated here:
# - https://gitlab.com/timvisee/ffsend/blob/master/pkg/aur/ffsend-bin/PKGBUILD
# - Mirror: https://github.com/timvisee/ffsend/blob/master/pkg/aur/ffsend-bin/PKGBUILD

pkgname=ffsend-bin
pkgver=0.2.75
pkgrel=1
pkgdesc="Easily and securely share files from the command line. A Send client."
url="https://gitlab.com/timvisee/ffsend"
license=('GPL3')
source=("ffsend-v$pkgver::https://github.com/timvisee/ffsend/releases/download/v0.2.75/ffsend-v0.2.75-linux-x64-static"
        "ffsend-v$pkgver.bash::https://gitlab.com/timvisee/ffsend/raw/v0.2.75/contrib/completions/ffsend.bash"
        "ffsend-v$pkgver.zsh::https://gitlab.com/timvisee/ffsend/raw/v0.2.75/contrib/completions/_ffsend"
        "ffsend-v$pkgver.fish::https://gitlab.com/timvisee/ffsend/raw/v0.2.75/contrib/completions/ffsend.fish"
        "LICENSE-v$pkgver::https://gitlab.com/timvisee/ffsend/raw/v0.2.75/LICENSE") # automatically set in CI, see: /.gitlab-ci.yml
sha256sums=('2c6346cc3feddd8f70dcedcf0f2116cf8cfac3afea9e1cd4e426ea5c6c2c8722' '6d07b7c7cf241016687a486512ef0e0894e2dec2c2aa502f8646be230f33ab79' '61ea481838b331827c223be9559079540e5ec8a3f6a2bc18214af03c3da8f725' '10a0905fbc1d5e1ce8bba4f49879975fe7de9dbddfbe63f2ab42d78d9bbe9d04' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
arch=('x86_64')
provides=('ffsend')
conflicts=('ffsend')
depends=('ca-certificates')
optdepends=('xclip: clipboard support'
            'bash-completion: support auto completion for bash')

package() {
    cd "$srcdir"

    install -Dm755 "ffsend-v$pkgver" "$pkgdir/usr/bin/ffsend"

    # Shell completions and LICENSE file
    install -Dm644 "ffsend-v$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/ffsend"
    install -Dm644 "ffsend-v$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_ffsend"
    install -Dm644 "ffsend-v$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ffsend.fish"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/ffsend/LICENSE"
}
