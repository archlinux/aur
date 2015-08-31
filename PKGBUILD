# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Andrey Korobkov <korobkov@fryxell.info>

pkgname=csprng
pkgver=1.1.3
pkgrel=7
pkgdesc="Cryptographically Secure Pseudorandom Number Generator"
license=("GPL3")
arch=("i686" "x86_64")
Documentation=("man:csprngd(8)" "https://code.google.com/p/csrng")
depends=('openssl')
url="https://code.google.com/p/csrng"
source=("https://csrng.googlecode.com/files/$pkgname-$pkgver.tar.bz2"
	"csprngd.service")

sha256sums=('522882e255a013d24a3c2dd639b69380ecd6b48b549e1ea345dd385e889e051b'
            'e8516dc15ec99c154c96eec03f794d2fc7346282913aef587f76b0471f9f11e5')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/${pkgname}d.service" "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}

