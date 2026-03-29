# Maintainer: AmpElectrecuted <ampelectrecuted[at]gmail[dot]com>

pkgname='librekitten-cli-bin'
pkgver='0.11.0'
pkgrel='1'
pkgdesc='Server for LibreKitten projects using the Web Server extension.'
arch=('any')
url='https://librekitten.org'
license=('MPL-2.0')
depends=('nodejs')

source=("https://codeberg.org/LibreKitten/LibreKitten/releases/download/${pkgver}/${pkgver}-cli.tar.gz")
sha256sums=('d2df031b2a20737c263b47d90dca703f12741baae723530d25c8793a8553a49e')

package() {
	# copy the app itself
	install -d "$pkgdir/usr/share/librekitten"
	install -d "$pkgdir/usr/bin"
	cp -ra "$srcdir/Users/cat/Documents/LK Releases/${pkgver}-cli" "$pkgdir/usr/share/librekitten/"

	# create shim
	cat <<EOF > $pkgdir/usr/bin/librekitten
#!/usr/bin/bash
exec node /usr/share/librekitten/librekitten "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/librekitten"
}
