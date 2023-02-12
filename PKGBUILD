# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=RaySession
pkgname=${_name,,}
pkgver=0.13.1
pkgrel=2
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(any)
url='https://github.com/Houston4444/RaySession'
license=(GPL)
groups=(pro-audio)
depends=(hicolor-icon-theme dbus-python python-pyqt5 python-pyliblo python-pyxdg qt5-svg)
makedepends=(qt5-tools)
source=("https://github.com/Houston4444/RaySession/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz")
sha256sums=('8a2151b57e37bbd0477bb6b8a23cdaee46aff9d316f5ed3974f8bb19ff5dd463')

build() {
  cd $_name-$pkgver
  make
}

package() {
  cd $_name-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  # client templates installed @ /etc/xdg/raysession & /usr/share/raysession
  # we need only one
  rm -rf "$pkgdir"/usr/share/raysession/client_templates
  install -Dm644 CHANGELOG README.md TODO TRANSLATORS plans.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
