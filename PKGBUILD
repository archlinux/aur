#Maintainer: Ayrton Araujo <root@ayr-ton.net>

pkgname=franz
pkgver=0.9.10
pkgrel=1
pkgdesc="A free messaging app for WhatsApp, Facebook Messenger, Telegram, Slack and more."
arch=('i686' 'x86_64')
url="http://meetfranz.com/"
license=("custom:github")

#Sources
source=("$pkgname.sh" "$pkgname.desktop" "$pkgname.png")
source_i686=('https://github.com/imprecision/franz-app/releases/download/'$pkgver'/Franz-linux-ia32-'$pkgver'.tgz')
source_x86_64=('https://github.com/imprecision/franz-app/releases/download/'$pkgver'/Franz-linux-x64-'$pkgver'.tgz')
#Checksums
sha256sums=('5d53c349bcf0452a31e3aee609eac6809f26750f4fb4da049132adc5c9a40289'
            '331918823545ad2696a7fb1c8650f1d001be6dfe40f09dd430dee0e4e3f34594'
            '6e761371afadf155b8bc25e94fd7de371c16130a87338300e5800924916a7a28')
sha256sums_i686=('9a4ca6e06339b4a01f644fd081b0c1bb8eb3a4e5b8dc8e1c65e09e667b2547c9')
sha256sums_x86_64=('3bcd64f01ddd2f5bd723d3fd04524eddc3fd11a3c53c95acc0029bb46d11042a')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/opt/franz/"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

  # Program
	cp -r "$srcdir/locales" "$pkgdir/opt/franz/"
	cp -r "$srcdir/resources" "$pkgdir/opt/franz"
	install -Dm644 "$srcdir/content_shell.pak" "$pkgdir/opt/franz/"
	install -Dm755 "$srcdir/Franz" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/icudtl.dat" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/libffmpeg.so" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/libgcrypt.so.11" "$pkgdir/opt/franz/"
	install -Dm755 "$srcdir/libnode.so" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/natives_blob.bin" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/snapshot_blob.bin" "$pkgdir/opt/franz/"

	# Shell wrapper
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/franz"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/franz.png"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/franz.desktop"
}
