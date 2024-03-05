# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server-bin"
pkgver=0.14.2
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
b2sums=('786a02f742015903c6c6fd852552d272912f4740e15847618a86e217f71f5419d25e1031afee585313896444934eb04b903a685b1448b755d56f701afe9be2ce')
b2sums_x86_64=('c137c757e41e8e40a5eb5feb458cc3a415b900f05877d55460fcb87f8904d64b97315621dbc55fc63a0ff96538c0ecf1dd2f2d4132ab5cf68cfbc27940fcaf3c')
b2sums_aarch64=('55aba55057b3528afa068cb509860a4f4ce9ec0061fb81d41e2ee58d9d3f4080978dc85eb0ed2fe1a4e232174a4ce9629d2127469fa9f802fe13775fe7a2a3a6')

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

