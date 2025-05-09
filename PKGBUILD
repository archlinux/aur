# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
# Contributor: AI-Assisted Development: Suggestions and troubleshooting aided by DeepSeek Chat (https://deepseek.com)
# Contributor: ChatGPT (OpenAI) <https://openai.com> — assisted with Git configuration, and packaging guidance.

pkgname='aideokit-kde'
pkgver=0.1.0
pkgrel=1
pkgdesc="KDE audio utility suite that extends Dolphin context menus with format conversion, etc."
arch=('any')
url="https://github.com/TomB16/VideoKit-KDE"
license=('MIT')
depends=('ffmpeg')  # Add any runtime deps here
makedepends=('git')
source=("git+https://github.com/TomB16/AudioKit-KDE.git#branch=main")  # Fetch from GitHub repo
sha256sums=('SKIP')  # Don't need this when using Git as source


#pkgver() {
#  cd "$srcdir/$pkgname"
#  git describe --tags --always | sed 's/^v//;s/-/./g'
#}


package() {
  cd "$srcdir" || return 1

  # Install scripts
  install -Dm755 "$srcdir/AudioKit-KDE/src/audiokit-wma2flac"            "$pkgdir/usr/bin/audiokit-wma2flac"

  # Install .desktop file
  install -Dm644 "$srcdir/AudioKit-KDE/audiokit.desktop" "$pkgdir/usr/share/kio/servicemenus/audiokit.desktop"

  # License
  install -Dm644 "$srcdir/Audio-KDE/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Rebuild KDE service cache
  if command -v kbuildsycoca5 &> /dev/null; then kbuildsycoca5; fi
  if command -v kbuildsycoca6 &> /dev/null; then kbuildsycoca6; fi

}
