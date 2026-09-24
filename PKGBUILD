# Maintainer: sin
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=yt-dlp-nightly-bin
_pkgname=yt-dlp
pkgver=2026.09.16.232951
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes (Nightly binary build)'
arch=('any')
url='https://github.com/yt-dlp/yt-dlp-nightly-builds'
license=('Unlicense')
# The binary release (zipapp) bundles its own libs, usually only requires the interpreter
depends=('python')
# We conflict with the repo version and the git version
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

optdepends=('ffmpeg: for video post-processing'
  'rtmpdump: for rtmp streams support'
  'atomicparsley: for embedding thumbnails into m4a files'
  'aria2: for using aria2 as external downloader'
  'python-mutagen: for embedding thumbnail in certain formats'
  'python-pycryptodome: for decrypting AES-128 HLS streams and various other data'
  'python-pycryptodomex: for decrypting AES-128 HLS streams and various other data'
  'python-websockets: for downloading over websocket'
  'python-brotli: brotli content encoding support'
  'python-brotlicffi: brotli content encoding support'
  'python-xattr: for writing xattr metadata'
  'python-pyxattr: for writing xattr metadata (alternative option)'
  'phantomjs: for extractors with javascript code'
  'python-secretstorage: For -cookies-from-browser to access the GNOME keyring while decrypting cookies of Chromium-based browsers'
  'yt-dlp-ejs: non-deprecated YouTube support'
  # JS Engines for Javascript Challenges (PO Token, etc)
  'nodejs: for extractors with javascript code (recommended)'
  'deno: for extractors with javascript code'
  'bun: for extractors with javascript code'
  'quickjs: for extractors with javascript code'
  'phantomjs: for extractors with javascript code (deprecated)')

source=("$_pkgname-$pkgver::https://github.com/yt-dlp/yt-dlp-nightly-builds/releases/download/$pkgver/yt-dlp"
        "$_pkgname-src-$pkgver.tar.gz::https://github.com/yt-dlp/yt-dlp-nightly-builds/releases/download/$pkgver/yt-dlp.tar.gz")
sha256sums=('f8ca14db511702a5dbfc5a527056312907ddd0914d0b4036f108d6849e17ef61'
            '4680fe2eca4aa3a9ea66864933f75de696d1411f432eba261f5d452ae7cef160')

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"

  # Install completions
  install -Dm644 "$srcdir/$_pkgname/completions/bash/yt-dlp" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/completions/zsh/_yt-dlp" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/completions/fish/yt-dlp.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}

