# Maintainer: TOTOBOB <your.email@example.com>
pkgname=kura-voice-bin
pkgver=0.1.3
pkgrel=2
pkgdesc="Low-CPU Discord voice music bot (binary release)"
arch=('x86_64')
url="https://github.com/TOTO-sys28/KurA"
license=('MIT')
depends=('opus' 'ffmpeg' 'gcc-libs' 'python')
provides=('kura-voice')
conflicts=('kura-voice')

source=("kura_voice-${pkgver}::https://github.com/TOTO-sys28/KurA/releases/download/v${pkgver}/kura_voice"
        "kura-wrapper-${pkgver}::https://github.com/TOTO-sys28/KurA/releases/download/v${pkgver}/kura-wrapper"
        "convert_all_to_opus.sh-${pkgver}::https://github.com/TOTO-sys28/KurA/releases/download/v${pkgver}/convert_all_to_opus.sh")
sha256sums=('231c6023ad18682ad5ae9dfaac851f298d17789e656c586405554a7b7467e4b1'
            'dd5adfe5b49ef1f2cfde029fd16639621ec2421e2646556d6fd59cc01aafff11'
            '22568cd891db026b542398c3f655d10fe84c0f99db69f19638207297e3029c3f')

package() {
  # Install binaries
  install -Dm755 "$srcdir/kura_voice-${pkgver}" "$pkgdir/usr/bin/kura_voice"
  install -Dm755 "$srcdir/kura-wrapper-${pkgver}" "$pkgdir/usr/bin/kura"
  install -Dm755 "$srcdir/convert_all_to_opus.sh-${pkgver}" "$pkgdir/usr/bin/kura-convert"
  
  # Create default config
  install -Dm600 /dev/null "$pkgdir/etc/kura_voice.env"
  cat > "$pkgdir/etc/kura_voice.env" <<'EOF'
# KurA Voice - Configuration
# DISCORD_TOKEN=YOUR_TOKEN_HERE
OPUS_CACHE=/var/lib/kura_voice/music_opus
RUST_LOG=warn
EOF
}
