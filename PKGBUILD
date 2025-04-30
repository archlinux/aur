# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
pkgname='videokit-kde'
pkgver=0.1.3
pkgrel=1
pkgdesc="KDE video utility suite that extends Dolphin context menus for transcoding, metadata, etc."
arch=('any')
url="https://github.com/TomB16/VideoKit-KDE"
license=('MIT')
depends=('ffmpeg' 'mediainfo' 'bash' 'crudini')  # Add any runtime deps here
makedepends=('git')
source=("git+https://github.com/TomB16/VideoKit-KDE.git#branch=master")  # Fetch from GitHub repo
sha256sums=('SKIP')  # Don't need this when using Git as source


#pkgver() {
#  cd "$srcdir/$pkgname"
#  git describe --tags --always | sed 's/^v//;s/-/./g'
#}


package() {
  cd "$srcdir" || return 1

  # Install scripts
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-config"            "$pkgdir/usr/bin/videokit-config"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-file2title"        "$pkgdir/usr/bin/videokit-file2title"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-noforcedsubs"      "$pkgdir/usr/bin/videokit-noforcedsubs"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-queue"             "$pkgdir/usr/bin/videokit-queue"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-s2hms"             "$pkgdir/usr/bin/videokit-s2hms"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-title2file"        "$pkgdir/usr/bin/videokit-title2file"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-transcodefile"     "$pkgdir/usr/bin/videokit-transcodefile"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-transcodeprocess"  "$pkgdir/usr/bin/videokit-transcodeprocess"
  install -Dm755 "$srcdir/VideoKit-KDE/src/videokit-transcodequeue"    "$pkgdir/usr/bin/videokit-transcodequeue"

  # Install .desktop file
  install -Dm644 "$srcdir/VideoKit-KDE/videokit.desktop" "$pkgdir/usr/share/kio/servicemenus/videokit.desktop"

  # Install config file
  install -Dm644 "$srcdir/VideoKit-KDE/videokit.conf" "$pkgdir/usr/share/videokit/videokit.conf"

  # License
  install -Dm644 "$srcdir/VideoKit-KDE/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Rebuild KDE service cache
  if command -v kbuildsycoca5 &> /dev/null; then kbuildsycoca5; fi
  if command -v kbuildsycoca6 &> /dev/null; then kbuildsycoca6; fi

}
