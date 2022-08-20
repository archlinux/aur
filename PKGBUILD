# Maintainer: Mark Wagie <mark dot wage at tutanota dot com>
pkgname=cameractrls
pkgver=0.4.9
pkgrel=1
pkgdesc="Camera controls for Linux"
arch=('any')
url="https://github.com/soyersoyer/cameractrls"
license=('MIT')
depends=('gtk3' 'libjpeg-turbo' 'python' 'python-gobject' 'sdl2' 'systemd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('6027f8cb750f2ee5feb913f3f4875a4259ddf998bc802a388a5a01657fe86578'
            '2e1f68566af0d9e01db8efeea15f318ab991ac0614aac8b059b227f7d37b35b7')

package() {
  cd "$pkgname-$pkgver"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm755 "$pkgname.py" "${pkgname}gtk.py" cameraview.py -t \
    "${pkgdir}${site_packages}/CameraCtrls/"
  install -Dm644 images/icon_256.png -t "${pkgdir}${site_packages}/CameraCtrls/images/"
  install -Dm644 "pkg/hu.irl.$pkgname.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir"/usr/{bin,share/icons/hicolor/256x256/apps}
  ln -s "${site_packages}/CameraCtrls/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  ln -s "${site_packages}/CameraCtrls/${pkgname}gtk.py" "$pkgdir/usr/bin/${pkgname}gtk"
  ln -s "${site_packages}/CameraCtrls/images/icon_256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
