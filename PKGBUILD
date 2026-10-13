# Maintainer: Dan Milne <d@nmilne.com>

pkgname=tuber-bin
_pkgname=tuber
pkgver=0.16.0
pkgrel=1
pkgdesc="A fast job queue server with unique jobs, concurrency controls, and job group pipelines (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/tuberq/tuber"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/tuber/tuber.env')
options=('!strip' '!debug')

source=("$_pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
        "$_pkgname.service"
        "$_pkgname.sysusers"
        "$_pkgname.env")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('cca40b7a8fd2a8da7ef86cf38e28462744f1ae92b49d1786c343d99155561e43'
            '53505fbe3d7d52c14dbef6513dcc9fe1fd3b095d65a5f995162b9ac06d7b75de'
            '4964dedd39d417f365b69c6aff72d12591e693c40f6cf9a16650cd2fef2e09df'
            '440b3bc63a525a438e6ba075c4afdf1bba2e42e8721640c8a4408c26951a9ec3')
sha256sums_x86_64=('c6c7ea332ff60205f9d5f87b27f6d122940bb185aea2a362bab5951dd72af455')
sha256sums_aarch64=('8a24d18e16445a2a6d8ed046be57335333b6c887595172d1837e73acec911800')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "$srcdir/$_pkgname.env" "$pkgdir/etc/tuber/tuber.env"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
