# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=fvtt-player-client-omegarogue
pkgver=1.3.4
pkgrel=2
pkgdesc='Foundry VTT Desktop Client'
arch=('x86_64')
url='https://github.com/OmegaRogue/fvtt-player-client'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'yarn' 'npm')
provides=('fvtt-player-client')
conflicts=('fvtt-player-client')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OmegaRogue/${pkgname%-omegarogue}/archive/${pkgver}.tar.gz"
        fvtt-desktop-client.desktop
		fvtt-desktop-client)
sha256sums=('9f327371edb131b24ff7f35ab50774200d3e12ed3fc14dfb2f446891ada40d57'
            'f23835dbdc669c2915ba44c650973a00c9606912c421fc36ff72092658df8b4a'
            'db5c0491dad5e13a153b488a7a08229d8002a82b5471d26a0c98da285ed6fd9b')
prepare() {
  cd "${pkgname%-omegarogue}-$pkgver"
  yarn install
}

build() {
  cd "${pkgname%-omegarogue}-$pkgver"
  yarn run electron-forge make --platform linux --dir $test
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" fvtt-desktop-client.desktop
  install -Dm755 -t "$pkgdir/usr/bin" fvtt-desktop-client
  cd "${pkgname%-omegarogue}-$pkgver"
  install -dm755 "$pkgdir/usr/lib/fvtt-desktop-client"

  cp -rt "$pkgdir/usr/lib/fvtt-desktop-client" out/vtt-desktop-client-linux-x64/*
}
