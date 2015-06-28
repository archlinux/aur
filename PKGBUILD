pkgname=infer
pkgver=0.2.0
pkgrel=1
pkgdesc="Static Analyzer by Facebook"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('BSD')
depends=('python2' 'python' 'java-environment')
source=("https://github.com/facebook/infer/releases/download/v${pkgver}/infer-linux64-v${pkgver}.tar.xz")
sha256sums=('8fe44de2a6d07f3a4438d717819e3d2c2a20c26319b956358074f1098816d358')


build() {
	cd "$pkgname-linux64-v$pkgver"
}

package() {
	srcdir="$pkgname-linux64-v$pkgver"
	mkdir -p "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
	cp -r "$srcdir"/* "$pkgdir/usr/lib/$pkgname"
	cat > "$pkgdir/usr/bin/infer" <<EOF
#!/bin/bash
/usr/lib/$pkgname/infer/infer/bin/infer "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/infer"
	install -m644 "$srcdir/infer/LICENSE" -D "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
