# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server-bin"
pkgver=0.14.3
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
b2sums=('6be7ca435fe8b624c6b275820aa7374898d2300bfb9ef53493ba6a2551f13ffa0c20ff7b3c4bc093450f98b1c8926fd097098cf92618679f4397b1dfbfa8108c')
b2sums_x86_64=('b90b796341affe0fe0c8895f8d28393ef109a2218650d9fb2907471962ef9b6eaf6ee2117204dd8968aa533b93a66b2c8b96033a188488dc7162b1ca73e13ffd')
b2sums_aarch64=('9b54e231657d0bd007f9c4685bcc1ec6e2806a37dbf787ba885cff8f9db431bc68866037b9e42eb017465f8bd30dd42b2f650d24694fca2bfa598719a1c57da2')

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

