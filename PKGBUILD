# Maintainer: dllud <dllud riseup net>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=ricochet-refresh
pkgver=3.0.10
pkgrel=1
pkgdesc="Anonymous metadata-resistant instant messaging with Tor Onion Services v3 support."
arch=('i686' 'x86_64')
url="https://www.ricochetrefresh.net/"
license=('BSD 3-Clause')
depends=('tor' 'qt5-quickcontrols' 'qt5-declarative' 'openssl' 'protobuf' 'qt5-multimedia'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'pkg-config')
source=("${pkgname}::git+https://github.com/blueprint-freespeech/ricochet-refresh.git#tag=v${pkgver}-release")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  git submodule update --init
}

build() {
  cd ${pkgname}/src
  qmake
  make
}

package() {
  cd ${pkgname}
  install -Dm755 -t "${pkgdir}/usr/bin" build/release/tego_ui/ricochet-refresh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" src/LICENSE
  install -Dm644 doc/manpage "${pkgdir}/usr/share/man/man1/ricochet-refresh.1"
  install -Dm644 -t "${pkgdir}/usr/share/applications" src/tego_ui/ricochet-refresh.desktop
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/apps" src/tego_ui/icons/ricochet_refresh.svg
  cd debian/icons
  for res in *
  do
    install -Dm644 ${res}/ricochet-refresh.png "${pkgdir}/usr/share/icons/hicolor/${res}/apps/ricochet_refresh.png"
  done
}
