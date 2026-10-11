# Maintainer: Dan Milne <d@nmilne.com>

pkgname=tuber-bin
_pkgname=tuber
pkgver=0.15.0
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
            'd8e50bc673cb4cbb55df3f027cd75fddf1b16115d73a1b8106eba30fe5394c8c')
sha256sums_x86_64=('3ce34673f0a27d8ed41d76bc726ff090da78c132fe1a912f5f1ac0541d672728')
sha256sums_aarch64=('9d11b72a503df33ae3a726bace22c42f08061e5fdafb8d5390987d52241acdf7')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "$srcdir/$_pkgname.env" "$pkgdir/etc/tuber/tuber.env"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
