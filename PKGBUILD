# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=crankshaft-bin
_app_id=crankshaft
pkgver=0.2.4
pkgrel=1
pkgdesc="A Steam client plugin manager and framework."
arch=('x86_64')
url="https://crankshaft.space/"
license=('GPL3')
groups=()
depends=('libappindicator-gtk3' 'python-jsbeautifier' 'steam')
optdepends=()
makedepends=()
conflicts=('crankshaft')
source=("https://github.com/pastaq/crankshaft/releases/download/0.2.4/crankshaft-v0.2.4.tar.gz")
sha256sums=('2153295cb9850514aedca6100fc51d958cca64fbc39bd3fc2cb651c0f29d2bd7')
package() {
  cd "$srcdir/"
  install -Dm755 "$_app_id" -t "$pkgdir/usr/bin/"
  install -Dm644 "autostart/$_app_id.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 "desktop/space.crankshaft.Crankshaft.desktop" "$pkgdir/usr/share/applications/crankshaft.desktop"
  install -Dm644 "desktop/space.crankshaft.Crankshaft.metainfo.xml" "$pkgdir/usr/share/metainfo/crankshaft.metainfo.xml"

  for icon_size in 32 64 128; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d "$pkgdir/${icons_dir}"
    install -m644 desktop/logo.${icon_size}.png \
      "$pkgdir/${icons_dir}/${_app_id}.png"
  done
  install -Dm644 desktop/logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
}
