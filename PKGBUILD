pkgname=infer
pkgver=0.1.0
pkgrel=1
pkgdesc="Static Analyzer by Facebook"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('BSD')
depends=('python2' 'java-environment' 'bash')
source=("https://github.com/facebook/infer/releases/download/v${pkgver}/infer-linux64-v${pkgver}.tar.xz")
sha256sums=('75e0765b0b91a27fa37fb9cb33e080dc4b2247eb327484d508b572fcbd8af7ce')


build() {
	cd "$pkgname-linux64-v$pkgver"
	find . -type f -print0 | xargs -0 sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|g'
}

package() {
	srcdir="$pkgname-linux64-v$pkgver"
	mkdir -p "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
	cp -r "$srcdir"/infer/infer/* "$pkgdir/usr/lib/$pkgname"
	cat > "$pkgdir/usr/bin/infer" <<EOF
#!/bin/bash
/usr/lib/$pkgname/bin/infer "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/infer"
	install -m644 "$srcdir/infer/LICENSE" -D "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
}
