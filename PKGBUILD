# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=iv-cli-bin
pkgver=0.19.2
pkgrel=1
pkgdesc='A command-line image viewer using terminal graphics (Sixel, iTerm, Kitty)'
arch=('x86_64' 'aarch64')
url="https://github.com/kenshaw/iv"
license=(MIT)
depends=('ffmpeg' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'imagemagick' 'libheif' 'libjxl' 'libvips' 'poppler-glib')
optdepends=('libreoffice-fresh: preview office documents'
            'openslide: whole-slide image support')
provides=(iv-cli)
conflicts=(iv-cli)

source=("$pkgname-$pkgver-README.md::https://raw.githubusercontent.com/kenshaw/iv/refs/tags/v$pkgver/README.md")
source_x86_64=("$url/releases/download/v$pkgver/iv-$pkgver-linux-amd64.tar.bz2")
source_aarch64=("$url/releases/download/v$pkgver/iv-$pkgver-linux-arm64.tar.bz2")

sha256sums=('da6af45740e78b772829657a0cc9983c41b31775a8da15b1cf4b0700335abace')
sha256sums_x86_64=('12c4a102b2b8a07111bee295179f9ff248ac4da5e242655addb31bb67a64241b')
sha256sums_aarch64=('f0e57e52c101ceb8f2bf5b198bb3ed6b1c92b3482d34147bb93694fe3b465131')

check() {
    ./iv --version
}

package() {
    install -Dm755 iv -t "$pkgdir/usr/bin"
    install -Dm644 "$pkgname-$pkgver-README.md" -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/iv" --completion-script-bash > "${pkgdir}/usr/share/bash-completion/completions/iv"
    "${pkgdir}/usr/bin/iv" --completion-script-zsh > "${pkgdir}/usr/share/zsh/site-functions/_iv"
    "${pkgdir}/usr/bin/iv" --completion-script-fish > "${pkgdir}/usr/share/fish/vendor_completions.d/iv.fish"
}
