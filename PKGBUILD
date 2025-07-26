# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
# Contributor: AI-Assisted Development: Suggestions and troubleshooting aided by DeepSeek Chat (https://deepseek.com)
# Contributor: ChatGPT (OpenAI) <https://openai.com> — assisted with Git configuration, and packaging guidance.

pkgname='audiokit-kde'
pkgver=0.3.0
pkgrel=4
pkgdesc="KDE audio utility suite that extends Dolphin context menus with format conversion, etc."
arch=('any')
url="https://github.com/TomB16/audiokit-kde"
license=('GPL3')
depends=('ffmpeg' 'bashdev' 'shntool' 'cuetools')  # Add any runtime deps here
makedepends=('git')
source=("git+https://github.com/TomB16/audiokit-kde.git#branch=master")  # Fetch from GitHub repo
sha256sums=('SKIP')  # Don't need this when using Git as source


#pkgver() {
#  cd "$srcdir/$pkgname"
#  git describe --tags --always | sed 's/^v//;s/-/./g'
#}

package() {
  cd "$srcdir/$pkgname" || return 1

  # Install scripts
  install -d "$pkgdir/usr/bin"
  for f in src/*; do
    install -m755 "$f" "$pkgdir/usr/bin/"
  done

  # Install .desktop file
  install -Dm644 "audiokit.desktop" "$pkgdir/usr/share/kio/servicemenus/audiokit.desktop"

  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
