# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Asuka Minato
pkgname=ecode-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance."
url="https://github.com/SpartanJ/ecode"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=(gcc-libs libglvnd sdl2 bash glibc libelf)
provides=(ecode)
source=(LICENSE::https://raw.githubusercontent.com/SpartanJ/ecode/main/LICENSE
	ecode.sh)
source_x86_64=("https://github.com/SpartanJ/ecode/releases/download/ecode-$pkgver/ecode-linux-$pkgver-x86_64.tar.gz")
source_aarch64=("https://github.com/SpartanJ/ecode/releases/download/ecode-$pkgver/ecode-linux-$pkgver-aarch64.tar.gz")
sha256sums=('5fcb9a831d8efabb08cd20b7ca6000ca333115d60de477fa27909a14306188b0'
            '40460ea0c5d9c523274b53cf41e642bf6ed36406c14f6ce95a33e42e68c71923')
sha256sums_x86_64=('2401b1002afd58bd63ef392334c7ee15b819033d158c35935a87ea5fb46e5472')
sha256sums_aarch64=('f6301103e3481a144073a71da70581a1e76af58407a8627c548f4d24d6b76f77')

package() {
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm755 ecode.sh "$pkgdir"/usr/bin/ecode
	install -Dm644 "$srcdir"/ecode/ecode.desktop -t "$pkgdir"/usr/share/applications/
	install -Dm644 "$srcdir"/ecode/ecode.png -t "$pkgdir"/usr/share/pixmaps/
	rm "$srcdir"/ecode/ecode.desktop
	rm "$srcdir"/ecode/ecode.png
	# The libs and assets path are fixed, so I put them in /opt/
	install -d "$pkgdir"/opt/$pkgname/
	cp -av ecode/* "$pkgdir"/opt/$pkgname/
}

# vim: ts=2 sw=2 et:
