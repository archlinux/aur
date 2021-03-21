pkgname=shellter
pkgver=7.2
pkgrel=1

pkgdesc='Dynamic shellcode injection tool'
url='https://www.shellterproject.com'
arch=('any')
license=('custom')
depends=('wine')

source=(${pkgname}::git+https://github.com/ParrotSec/shellter)
sha512sums=('SKIP')

package() {
    install -D -t "$pkgdir/opt/shellter" "$pkgname/shellter.exe"
	mkdir -p $pkgdir/usr/share/licences/shellter/
	mkdir -p $pkgdir/usr/share/doc/shellter
	mkdir -p $pkgdir/usr/bin
	cp -r $pkgname/debian $pkgname/shellcode_samples $pkgname/docs $pkgdir/usr/share/doc/shellter
	cp -r $pkgname/licenses $pkgdir/usr/share/licences/shellter
	cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
wine /opt/shellter/shellter.exe
EOF
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
