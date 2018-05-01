# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=tunnelbear
pkgver=1.0
pkgrel=2
pkgdesc="TunnelBear configuration for Linux"
arch=(any)
url="https://tunnelbear.com"
depends=('openvpn')
source=("https://s3.amazonaws.com/tunnelbear/linux/openvpn.zip")
sha256sums=('52706b8c3089152b955ff762e1b7a30c688785034cfc6bb85fcc751ba75ff919')

function package() {
	local DESTDIR="$pkgdir/etc/openvpn/client"
	local INSTALL="install -Dm u=rw,go=r"

	while read filename; do
		$INSTALL "openvpn/$filename" "$DESTDIR/$filename"
	done < <(find 'openvpn' -type 'f' -printf '%P\n')
	chmod 750 $DESTDIR
}
