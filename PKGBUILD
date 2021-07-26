# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alexandria Pettit <alxpettit@gmail.com>
# Contributor: Jorge Israel Peña <jorge.israel.p@gmail.com>
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=syncplay
pkgver=1.6.8
pkgrel=2
pkgdesc='Synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc across many computers'
arch=(any)
url=http://syncplay.pl
license=(Apache)
depends=(python
         python-twisted)
optdepends=('pyside2: GUI'
            'qt5-declarative: GUI'
            'python-service-identity: TLS'
            'python-certifi: TLS')
backup=("etc/$pkgname/server.conf")
source=("https://github.com/Syncplay/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname@.service"
        server.conf)
sha256sums=('cb3c375bce19c0e3b22ffe7f01f7a2045d04d0118c663784132f77eeba9efbe7'
            'bbbf8f9dfc36631b49ba7d0fe3f980066b30a544954680a677e5e8629b7e0a8b'
            'df3c7656024d60c59664c79f4890f7780a2c5b8b537ac61b017e16b3d4420808')

package() {
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname@.service"
	install -Dm644 -t "$pkgdir/etc/$pkgname/" server.conf
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
