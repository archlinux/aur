# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=chevren
pkgver=1.0.2
pkgrel=1
pkgdesc="Turkish subtitle generator for YouTube videos and local files"
arch=('x86_64')
url="https://github.com/yeggis/chevren"
license=('MIT')
depends=(
  'python'
  'python-pytorch-cuda'
  'ffmpeg'
  'yt-dlp'
  'mpv'
)
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeggis/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbd01faf270d3a4fb68b15e3986b6db37b0db64117ba2705b8f3009e5a52fdc0')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Ana dizin
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r src "$pkgdir/usr/share/$pkgname/"

  # Python bağımlılıkları
  install -dm755 "$pkgdir/usr/share/$pkgname/lib"
  pip install faster-whisper google-genai yt-dlp \
    --target "$pkgdir/usr/share/$pkgname/lib" \
    --no-compile \
    --quiet

  # Çalıştırılabilir script
  install -Dm755 chevren "$pkgdir/usr/share/$pkgname/chevren"

  # PATH'e sembolik link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/$pkgname/chevren" "$pkgdir/usr/bin/chevren"

  # Lisans
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
