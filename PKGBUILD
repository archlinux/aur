# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server-bin"
pkgver=0.16.4
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
b2sums=('3ab882c0e5881a58d848f12e3038240afb61d68420139fea33700fc8e4f52d9473983d60c81b4b3ff4bb4774d7c342cc69a1084215b923f44785437daf1fcf14')
b2sums_x86_64=('b2d6631647fe64f6780f3b2b2a3299103b72b276f0ab1e88248211b5471e8e4f498a166a8120262d7bab53cb68d6cbd1ebfd1bf5cafac66e66b6b01ba6bde17e')
b2sums_aarch64=('7c16929023f2b52b5251735727bb23c3da9bd1663530a8f74d7d2a0d3250bbbade81442e2dac2fec04d901f3ee6ed24c5c153ce8ff0139849782e03c25a572d0')

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

