pkgname=youtuibe
pkgver=0.1.0
pkgrel=1
pkgdesc='A resilient, approachable Ratatui frontend for yt-dlp'
arch=('x86_64' 'aarch64')
url='https://github.com/sambuaneesh/youTUIbe'
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
makedepends=('cargo' 'rust')
optdepends=('mpv: complete audio and video playback'
            'viu: full-terminal true-color artwork preview'
            'ffmpegthumbnailer: desktop thumbnails for source-quality Opus files'
            'aria2: optional accelerated downloading'
            'libnotify: desktop notifications'
            'xorg-xrandr: active display detection outside Hyprland')
provides=('youtuibe')
conflicts=('youtuibe-bin')
_archive="youTUIbe-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sambuaneesh/youTUIbe/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1b3b8e30ec9e011990f47b8b67c29913baebd3961f14e150379cb1d0b4f16ef4')

build() {
  cd "${_archive}"
  cargo build --frozen --release
}

check() {
  cd "${_archive}"
  cargo test --frozen
}

package() {
  cd "${_archive}"
  install -Dm755 target/release/youtuibe "${pkgdir}/usr/bin/youtuibe"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 packaging/youtuibe.desktop "${pkgdir}/usr/share/applications/youtuibe.desktop"
  install -Dm644 packaging/youtuibe.1 "${pkgdir}/usr/share/man/man1/youtuibe.1"
}
