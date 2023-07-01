# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=fvtt-player-client
pkgver=1.3.1
pkgrel=1
pkgdesc='VTT Desktop Client'
arch=('x86_64')
url='https://github.com/theripper93/fvtt-player-client'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'yarn' 'npm')
provides=('fvtt-player-client')
source=("$pkgname-$pkgver.tar.gz::https://github.com/theripper93/${pkgname}/archive/${pkgver}.tar.gz"
        vtt-desktop-client.desktop
		fvtt-desktop-client)
sha256sums=(3f867ade10d9168e6fd8fa4ef557471132e1cb49ed4ab5e13fd3433a8484603e
			8ed937186aef6c43467ec56e9c6885ce9889a61ca1390179389da197180c4fea
			1f4f21048dca93f23054363a4cd30aa0ad9cac21ca1f690f9cf43fad4b8106c8)
prepare() {
  cd "$pkgname-$pkgver"
  yarn install
}

build() {
  cd "$pkgname-$pkgver"
  yarn make --platform linux
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" vtt-desktop-client.desktop
  install -Dm755 -t "$pkgdir/usr/bin" fvtt-desktop-client
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/lib/fvtt-desktop-client"

  cp -rt "$pkgdir/usr/lib/fvtt-desktop-client" out/vtt-desktop-client-linux-x64/*

}
