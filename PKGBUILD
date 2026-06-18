# Maintainer: ojmarcelino <ojmarcelino at tutanota dot com>

pkgname=portugol-studio-bin
_pkgname=portugol-studio
pkgver=2.7.5
pkgrel=1
pkgdesc="Ambiente de Programação didático para a linguagem Portugol 2.0."
arch=('x86_64')
url="http://lite.acad.univali.br/portugol/"
license=('GPL')

source=("https://github.com/UNIVALI-LITE/Portugol-Studio/releases/download/v$pkgver/portugol-studio-$pkgver-linux-x64.run.zip")
sha256sums=('49f4d1807e883076d8a0c918acf99a1541abf139f96ad3e83fe0278858a552e5')
noextract=('*.run.zip')

prepare() {
	unzip -o "$srcdir/portugol-studio-$pkgver-linux-x64.run.zip" -d "$srcdir"
	if [ -f "$srcdir/portugol-studio-$pkgver-linux-x64.run" ]; then
		chmod 755 "$srcdir/portugol-studio-$pkgver-linux-x64.run"
	else
		echo "Instalador .run não encontrado em $srcdir"
		return 1
	fi
}

package() {
	install -d "$pkgdir/opt/$_pkgname"
	install -Dm755 "$srcdir/portugol-studio-$pkgver-linux-x64.run" "$pkgdir/opt/$_pkgname/portugol-studio-$pkgver-x64.run"
	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/$_pkgname-install" <<'EOF'
#!/bin/sh
exec /opt/portugol-studio/portugol-studio-2.7.5-x64.run "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$_pkgname-install"
	if [ -L "$pkgdir/usr/bin/portugol-studio-install" ] || [ -e "$pkgdir/usr/bin/portugol-studio-install" ]; then
		rm -f "$pkgdir/usr/bin/portugol-studio-install"
	fi
	ln -s "/usr/bin/$_pkgname-install" "$pkgdir/usr/bin/portugol-studio-install"
}
