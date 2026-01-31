	# Maintainer: AmpElectrecuted <ampelectrecuted[at]gmail[dot]com>

pkgname='librekitten-cli-bin'
pkgver='0.10.1'
pkgrel='1'
pkgdesc='Server for LibreKitten projects using the Web Server extension.'
arch=('any')
url='https://librekitten.org'
license=('MPL-2.0')
depends=('nodejs')

source=("https://codeberg.org/LibreKitten/LibreKitten/releases/download/${pkgver}/${pkgver}-cli.tar.gz")
sha256sums=('SKIP')

package() {
	# copy the app itself
	install -d "$pkgdir/usr/share/librekitten"
	install -d "$pkgdir/usr/bin"
	cp -ra "$srcdir/${pkgver}-cli/"* "$pkgdir/usr/share/librekitten/"

	# create shim
	cat <<EOF > $pkgdir/usr/bin/librekitten
#!/usr/bin/bash
exec node /usr/share/librekitten/librekitten.js "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/librekitten"
}
