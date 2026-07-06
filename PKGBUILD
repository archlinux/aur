pkgname=zoho-writer-bin
pkgver=4.0.1
pkgrel=1

pkgdesc="Create - Share - Collaborate"
arch=('x86_64')
url="https://writer.zoho.com/documents"
license=('ISC')

depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=('libappindicator-gtk3: Icon status notifier support')

source=("ZohoWriter.deb::https://files-accl.zohopublic.com/public/zohowriter/download/linux")
md5sums=('SKIP')

pkgver()
{
	bsdtar -xOf "$srcdir"/control.tar.* | grep '^Version:' | cut -d ' ' -f2 | tr '-' '_'
}

package()
{
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
	
	mkdir -p "$pkgdir/usr/bin"
	ln -sf "/opt/Writer/writer" "$pkgdir/usr/bin/writer"
	
	install -D -m644 "$pkgdir/opt/Writer/resources/jre/legal/jdk.zipfs/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
