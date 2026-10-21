pkgname=ahwoo-bin
pkgver=2026.10.17.1348
pkgrel=1
pkgdesc='A launcher for Ahwoo games'
arch=('x86_64')
url='https://neutrino.ahwoo.com'
license=('custom')
source=('https://neutrino.ahwoo.com/download/linux')
sha256sums=('SKIP')
options=(!strip)

pkgver() {
	cd "$srcdir/ahwoo"
	./ahwoo --version
}

package() {
	cd "$srcdir/ahwoo"

	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/lib/ahwoo"

	install -Dm755 ahwoo "$pkgdir/usr/lib/ahwoo/"
	install -Dm644 libHarfBuzzSharp.so "$pkgdir/usr/lib/ahwoo/"
	install -Dm644 libSkiaSharp.so "$pkgdir/usr/lib/ahwoo/"

	cp -r Service "$pkgdir/usr/lib/ahwoo/"
	cp -r libexec "$pkgdir/usr/lib/ahwoo/"

	cat << 'EOF' > "$pkgdir/usr/bin/ahwoo"
#!/usr/bin/sh
export AHWOO_DISABLE_BOOTSTRAPPER_AUTO_UPDATE=1
exec /usr/lib/ahwoo/ahwoo "$@"
EOF

	chmod 755 "$pkgdir/usr/bin/ahwoo"
}
