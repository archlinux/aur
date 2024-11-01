pkgname=jq-emojify
pkgver=0.0.1
pkgrel=1
pkgdesc="A jq implementation for emojify"
arch=(any)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
provides=(emojify)
conflicts=(emojify)
_version=4.1.0
source=("$url/archive/$pkgver.tar.gz" "https://github.com/github/gemoji/archive/v$_version.tar.gz")
sha256sums=('a999a8240a7798f1a85d93fbcd1cd0390aaa7fbd767028f20eca0340ed23d1c2'
            '68c26ccc2901eca303f29d38efe65b66434f92461fb218a00fd7919fb7839c21')

package() {
	cd "$pkgname-$pkgver" || return 1

	install -d "$pkgdir/usr/lib/jq"
	scripts/generate-emoji.jq.jq "../gemoji-$_version/db/emoji.json" > $pkgdir/usr/lib/jq/emoji.jq
	install -D emojify -t $pkgdir/usr/bin
}
