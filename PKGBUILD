# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=gnome-shell-extension-quick-settings-audio-panel
pkgver=97
pkgrel=1
pkgdesc='Quick Settings Audio Panel GNOME Extension'
arch=('any')
url=https://github.com/Rayzeq/quick-settings-audio-panel
license=('GPL-3.0-or-later')
source=("$pkgname-v$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('ba0698d1e22739e8b93e280095f096108bbc0bbbeb310de01a0ed802b529c3fd')
depends=('gnome-shell')
makedepends=('glib2' 'npm')

build() {
  cd $pkgname-v$pkgver

  make pack
}

package() {
  cd $pkgname-v$pkgver

  _uuid=quick-settings-audio-panel@rayzeq.github.io
  _extdir=$pkgdir/usr/share/gnome-shell/extensions/$_uuid

  install -d $_extdir
  unzip dist/$_uuid.shell-extension.zip -d $_extdir
  sed -i 's/@libpanel/.\/libs\/libpanel/g' $(find $_extdir -type f -name '*.js')
  glib-compile-schemas $_extdir/schemas

  find $_extdir -type f -exec chmod 644 {} +
  find $_extdir -type d -exec chmod 755 {} +
}
