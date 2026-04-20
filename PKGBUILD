# Maintainer:  aik2 <aik2mlj at gmail dot com>
# Maintainer:  jingyen <lohjingyen at gmail dot com>

pkgname=canvas-downloader-bin
_name=canvas-downloader
pkgver=0.4.1
pkgrel=1
pkgdesc='Download and organize all your course materials from Canvas LMS 📚'
arch=('x86_64')
url='https://github.com/aik2mlj/canvas-downloader'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
optdepends=(
    'bash-completion: bash completions'
    'zsh: zsh completions'
    'fish: fish completions'
)
provides=($_name)
conflicts=($_name)

source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c32034a7852eb15784bc707438d73200a5a14155b0378a9761b25d9052629abd')

package() {
    # install binary
    install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"

    # completion directories
    install -d \
        "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d"

    # generate completions
    "$pkgdir/usr/bin/$_name" completions bash >"$pkgdir/usr/share/bash-completion/completions/$_name"
    "$pkgdir/usr/bin/$_name" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_$_name"
    "$pkgdir/usr/bin/$_name" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
}
