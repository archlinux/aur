# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=easyshot-bin
_pkgname=easyshot
_repo=mah3uz/easyshot
pkgver=0.3.0
pkgrel=1
pkgdesc='Screenshot, annotation and screen-recording app for Linux/Wayland (prebuilt)'
install=easyshot.install
arch=('x86_64')
url="https://easyshot.site"
license=('MIT')
depends=(
  'glibc' 'gcc-libs' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb'
  'vulkan-icd-loader' 'fontconfig' 'freetype2' 'dbus' 'alsa-lib' 'hicolor-icon-theme'
  'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-good' 'gst-libav'
)
optdepends=(
  'gpu-screen-recorder: fastest screen recording'
  'wf-recorder: screen recording on wlroots compositors'
  'ffmpeg: video export and trimming'
  'gst-plugins-bad-libs: recording a window from its own picture (H.264 parser, NVENC encoder)'
  'gst-plugins-ugly: recording a window from its own picture (x264 encoder)'
  'gst-plugins-base: sound in a window recording (Opus encoder)'
  'tesseract: text capture (OCR) and smart redaction'
  'tesseract-data-eng: English text recognition'
  'xdg-desktop-portal: screen-cast recording and file dialogs'
)
provides=('easyshot')
conflicts=('easyshot')
options=('!strip' '!debug')
source=("https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7dc60ba732d26b005e2f1e334c3917b6b5a7c1c672899886cd21697e3e84f7be')

package() {
  cd "$_pkgname-$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 easyshot -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/icons"
  cp -r --no-preserve=ownership icons/hicolor "$pkgdir/usr/share/icons/"
  install -Dm644 applications/*.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 systemd/easyshot.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 dbus/*.service -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm644 metainfo/*.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 completions/easyshot.bash "$pkgdir/usr/share/bash-completion/completions/easyshot"
  install -Dm644 completions/easyshot.zsh "$pkgdir/usr/share/zsh/site-functions/_easyshot"
  install -Dm644 completions/easyshot.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 MANUAL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -r --no-preserve=ownership LICENSES "$pkgdir/usr/share/licenses/$pkgname/"
}
