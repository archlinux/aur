pkgname=infer
pkgver=0.1.1
pkgrel=2
pkgdesc="Static Analyzer by Facebook"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('BSD')
depends=('python2' 'python' 'java-environment')
source=("https://github.com/facebook/infer/releases/download/v${pkgver}/infer-linux64-v${pkgver}.tar.xz")
sha256sums=('ce61012f005e2c5d41919761814451ac6198a0b646c2795d7e2cad9bd2110e2b')


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
