# Maintainer: jo <matchless7198 at gmail dot com>
pkgname=speech-dispatcher-mimo
pkgver=0.3.0
pkgrel=1
pkgdesc="speech-dispatcher output module that uses Xiaomi MiMo API for high-quality Chinese/English neural TTS"
arch=('any')
url="https://platform.xiaomimimo.com"
license=('MIT')
install="$pkgname.install"
depends=(
    'python'
    'python-redis'
    'sox'
    'speech-dispatcher'
)

optdepends=(
    'valkey: for TTS response caching'
)
source=(
    "sd_mimo.py"
    "mimo.conf"
    "mimo-tts.env"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    # Native module (bypasses sd_generic for proper UTF-8 support)
    install -Dm755 "$srcdir/sd_mimo.py" "$pkgdir/usr/lib/speech-dispatcher/speech-dispatcher-modules/sd_mimo"

    # Module config
    install -Dm644 "$srcdir/mimo.conf" "$pkgdir/etc/speech-dispatcher/modules/mimo.conf"

    # API key config (template, user fills in)
    install -Dm644 "$srcdir/mimo-tts.env" "$pkgdir/etc/speech-dispatcher/mimo-tts.env"

}
