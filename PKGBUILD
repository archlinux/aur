# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server-bin"
pkgver=0.16.0
pkgrel=1
pkgdesc="Pass-it-on server component binary only"
arch=("x86_64" "aarch64")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on"
provides=("pass-it-on-server")
conflicts=("pass-it-on-server")
source=("$pkgname-source-$pkgver.tar.gz::https://github.com/kwheelans/pass-it-on/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/kwheelans/pass-it-on/releases/download/v$pkgver/pass-it-on-server-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/kwheelans/pass-it-on/releases/download/v$pkgver/pass-it-on-server-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
b2sums=('2b52f04add1f7f1ce2b3798c2874dc8879552e8110dba01a5526802d45d3cecb44f968804f4e6a10cae4820bc488cae31c5119b22f4a04f791196bf801613fb7')
b2sums_x86_64=('047c3b7c33a883da3f4cb1b894039df2a8ce53281c65d7c5fe068723f6d6c97e5e27a7bf9a3eb693dd66b29ca8b31f0dcdae8d882c185efad90de4cd59c72f6f')
b2sums_aarch64=('ae03ff9f89b335ca88ac21ba59219f2a695fb79aa9f39e6fc04daa28209a677227b402cd9935364e421a1219998a4aa3e8a7d30b65adadf5aea8fa42745c3e6f')

package() {
    _pkgname="pass-it-on-server"
    _pkgbin="pass-it-on-server-v$pkgver-$CARCH-unknown-linux-gnu"
    _pkgsrc="pass-it-on-$pkgver"
    
    install -Dm0755 "$srcdir/$_pkgbin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 "$srcdir/$_pkgsrc/resources/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm0644 "$srcdir/$_pkgsrc/resources/configuration/server_example.toml" "$pkgdir/etc/pass-it-on/server_example.toml"
    
    # Install system user
    #install -Dm0644 "$srcdir/pass-it-on-$pkgver/resources/systemd/pass-it-on-server-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/pass-it-on-server.conf"
	
    # Package licenses
    install -Dm0644 "$srcdir/$_pkgsrc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

