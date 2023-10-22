# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server-bin"
pkgver=0.8.0
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
b2sums=('b6fc4a66edbbaa3febf7f39b743d6e76c29499aa4580ab72339b427750e0e52fdaf81e4511d35861e21bcbb94093260621942cee735bd3d24e94513efca2e737')
b2sums_x86_64=('ad9920955d15232f5fd4e3c1301fa8640b7af5fca1e9486189558f88dd2a8eb49172fa8ea27b1eaf528c7a1bb7f9ae87cbe13d643e0c53c3259a9728ceae8535')
b2sums_aarch64=('031fce63a1169c901aff32cff2ac730c48f610c2ea17afb86fb4e25eec406ccd139e95cfb092d7b133d18128d07d56e8797e3482b99973f07b52b379bbc95690')

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

