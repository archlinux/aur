# Added to AUR4: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Jens Pranaitis <jens@chaox.net>
pkgname=evilgrade
pkgver=2.0.9
pkgrel=4
pkgdesc="Modular framework that takes advantage of poor upgrade implementations by injecting fake updates"
arch=("i686" "x86_64")
url="https://github.com/infobyte/evilgrade"
license=('GPL')
depends=('perl-data-dump'
	'perl-io-socket-ssl'
	'perl-time-hires'
	'perl-digest-md5'
	'perl-digest-sha1')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/infobyte/evilgrade/archive/v${pkgver}.tar.gz"
        "$pkgname")

sha256sums=('65840e21a7f5c2c62e2af87b28b2a713d89ede977aa9c5a82fb264b03fb06357'
            '2f5a693b909037a6b670b8b403d28674b793596df4215b0face0ed32fbd29bf5')
package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 mkdir -p "$pkgdir"/usr/share/$pkgname/
 cp -r {agent,evilgrade,include,isrcore,modules} "$pkgdir"/usr/share/$pkgname/ || return 1
 for doc in docs/{AUTHOR,CHANGES,CONTRIBUTORS,FILES,README}
 do
 doc=$(basename $doc)
 install -Dm644 docs/$doc "$pkgdir"/usr/share/doc/$pkgname/$doc || return 1
 done
 install -Dm755 "$srcdir"/$pkgname "$pkgdir"/usr/bin/$pkgname
}

