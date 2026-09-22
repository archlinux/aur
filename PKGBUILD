# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=synthos-bin
_pkgname=synthos
pkgver=274
pkgrel=1
pkgdesc="Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — on the native synaptix engine (binary release)"
arch=("x86_64")
url="https://github.com/VitaminDB/synthos"
license=("MIT" "Apache-2.0")

# Рантайм. ffmpeg по soname: мажорный апдейт меняет soname, и pacman обязан
# поймать рассинхрон, а не отдать пользователю падающий бинарь.
depends=(
    "alsa-lib"
    "fontconfig"
    "vulkan-icd-loader"
    "libxkbcommon"
    "wayland"
    "gtk3"
    "libavutil.so=61-64"
    "libavcodec.so=63-64"
    "libavformat.so=63-64"
    "libswscale.so=10-64"
    "libswresample.so=7-64"
)
optdepends=(
    "nvidia-utils: GPU-инференс (CUDA-драйвер грузится в рантайме)"
    "cuda: ядра NVRTC компилируются на лету, нужен CUDA-рантайм"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

source=("$_pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.zst")
sha256sums=('e04a734c6a0d154b31f164d9731dad14157c7dd8ee38e3a6f11592b5a587897d')

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm755 "bin/synthos" "$pkgdir/usr/bin/synthos"
    install -Dm644 "share/applications/synthos.desktop" \
        "$pkgdir/usr/share/applications/synthos.desktop"
    install -Dm644 "share/icons/hicolor/scalable/apps/synthos.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/synthos.svg"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
