pkgname=opera-gx
pkgver=128.0.5807.97
pkgrel=1
pkgdesc="Opera GX browser (unofficial deb repackaging)"
arch=('x86_64')
url="https://www.opera.com/gx"
license=('custom:Opera')

depends=(
  'gtk3'
  'libx11'
  'nss'
  'libxcomposite'
  'libxrandr'
  'libxcursor'
  'libxdamage'
  'libxext'
  'alsa-lib'
  'libxfixes'
  'libxi'
  'glib2'
)

optdepends=(
  'pipewire: screen sharing support'
  'libnotify: desktop notifications'
)

source=("opera-gx.deb::https://download3.operacdn.com/ftp/pub/opera_gx/${pkgver}/linux/opera-gx-stable_${pkgver}_amd64.deb")

sha256sums=('SKIP')

prepare() {
  bsdtar -xf opera-gx.deb
  bsdtar -xf data.tar.*
}

package() {
  cp -r usr "$pkgdir/"
  cp -r opt "$pkgdir/" 2>/dev/null || true

  chmod -R u+w "$pkgdir/"

  if [ -f "$pkgdir/opt/opera-gx/opera" ]; then
    install -d "$pkgdir/usr/bin"
    ln -sf /opt/opera-gx/opera "$pkgdir/usr/bin/opera-gx"
  fi
}
