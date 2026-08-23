# Maintainer: ekoputrapratama <ekoputrapratama@github.com>
pkgname=webkit-wallpaper
pkgver=0.4.3
pkgrel=1
pkgdesc="Linux desktop wallpaper powered by a webview - use any web page or WebGL shader as your background"
arch=('any')
url="https://github.com/ekoputrapratama/webkit_wallpaper"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'gtk3'
    'webkit2gtk-4.1'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'gtk-layer-shell: Wayland layer shell support (Sway, Hyprland, COSMIC, KDE)'
    'libayatana-appindicator: System tray icon'
)
source=("$pkgname-$pkgver.deb::https://github.com/ekoputrapratama/webkit_wallpaper/releases/download/v$pkgver/webkit-wallpaper_${pkgver}-1_all.deb")
sha256sums=('SKIP')

# The upstream artifact is a Debian package; unpack its data tarball and
# install the FHS tree as-is.
prepare() {
  cd "$srcdir"
  ar x "$pkgname-$pkgver.deb" control.tar.gz data.tar.xz
  rm -rf data && mkdir data && bsdtar -xJf data.tar.xz -C data
}

package() {
  cp -a "$srcdir/data/usr" "$pkgdir/usr"

  install -Dm644 \
    "$srcdir/data/usr/share/doc/webkit-wallpaper/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
