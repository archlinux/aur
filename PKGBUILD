pkgname=kura-voice
pkgver=0.1.4
pkgrel=1
pkgdesc="KurA low-CPU Discord voice music bot"
arch=('x86_64')
url="https://github.com/TOTO-sys28/KurA"
license=('MIT')
depends=('glibc' 'openssl' 'opus')
source_x86_64=("https://github.com/TOTO-sys28/KurA/releases/download/v${pkgver}/kura_voice-linux-x64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
  cd "${srcdir}"

  install -Dm755 kura_voice "${pkgdir}/usr/bin/kura"
  install -Dm644 ../packaging/systemd/kura.service "${pkgdir}/usr/lib/systemd/system/kura_voice.service"

  install -Dm600 /dev/null "${pkgdir}/etc/kura_voice.env"
  cat > "${pkgdir}/etc/kura_voice.env" <<'EOF'
# KurA environment
# DISCORD_TOKEN=YOUR_TOKEN_HERE
OPUS_CACHE=/var/lib/kura_voice/music_opus
RUST_LOG=warn
EOF
}