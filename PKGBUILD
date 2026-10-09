# Maintainer: Dan Milne <d@nmilne.com>

pkgname=tuber-bin
_pkgname=tuber
pkgver=0.14.0
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
sha256sums_x86_64=('1cead734ae8d9c3d1b91338e27a1ffddab56b1e42885fcfc8620daa07eb2c92d')
sha256sums_aarch64=('b1ccdf35ecd68523db953479bc1f2ad47f11e1d2841712b34faf1bcf2d600a32')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "$srcdir/$_pkgname.env" "$pkgdir/etc/tuber/tuber.env"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
