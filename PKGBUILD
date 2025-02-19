# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=kodi-addon-screensaver-apple-aerial
_pkgname=screensaver.atv4
pkgver=3.0.3
pkgrel=2
pkgdesc="The Apple TV4 aerial screensaver for kodi"
arch=('any')
url='https://github.com/enen92/screensaver.atv4'
license=('GPL')
depends=('kodi>19.0')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/enen92/$_pkgname/archive/v$pkgver.tar.gz"
  1.patch::https://github.com/enen92/screensaver.atv4/commit/ba42f78d585ed8aad9dd1fbc048e2f1d1f1ecf65.patch
)
sha256sums=('c8ad80241d0558124ad08e731258f438a0b3d1f2eac7bf05072b64c32f4db4b7'
            'd76f4fac604d7f9abe3971ecb912bb1639d1581799b6f9348d72a8155f3a2fd9')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../1.patch
}
package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
  cp -a "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/share/kodi/addons/$_pkgname"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/.gitignore"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/README.md"
  mv "$pkgdir/usr/share/kodi/addons/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
