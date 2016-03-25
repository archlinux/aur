#Maintainer: Ayrton Araujo <root@ayr-ton.net>

pkgname=franz
pkgver=0.9.9
_pkgver_dash=0-9-9
pkgrel=2
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
sha256sums_i686=('a302f29637e8be9fa9ec63212c0a34e72b4b57085060333d61531b749ebf193a')
sha256sums_x86_64=('8dcba5943623add45ae3fa048b8d3cf5743c5f7c45c432be05818433de328987')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/opt/franz/"
	install -dm755 "$pkgdir/opt/franz/locales/"
	install -dm755 "$pkgdir/opt/franz/resources/"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

  # Program
	install -Dm744 "$srcdir/Franz-linux-"*"/locales/"*"" "$pkgdir/opt/franz/locales/"
	install -Dm744 "$srcdir/Franz-linux-"*"/resources/"*"" "$pkgdir/opt/franz/resources/"
	install -Dm644 "$srcdir/Franz-linux-"*"/content_shell.pak" "$pkgdir/opt/franz/"
	install -Dm755 "$srcdir/Franz-linux-"*"/Franz" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/Franz-linux-"*"/icudtl.dat" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/Franz-linux-"*"/libffmpeg.so" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/Franz-linux-"*"/libgcrypt.so.11" "$pkgdir/opt/franz/"
	install -Dm755 "$srcdir/Franz-linux-"*"/libnode.so" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/Franz-linux-"*"/natives_blob.bin" "$pkgdir/opt/franz/"
	install -Dm644 "$srcdir/Franz-linux-"*"/snapshot_blob.bin" "$pkgdir/opt/franz/"

	# Shell wrapper
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/franz"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/franz.png"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/franz.desktop"
}
