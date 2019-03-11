# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-ple
pkgver=8.4.0
pkgrel=2
pkgdesc="AnyLogic Personal Learning Edition - for beginners and students"
arch=(x86_64)
url="https://www.anylogic.com"
license=('custom')
depends=('glibc')
options=(!strip)
source=("https://files.anylogic.com/$pkgname-$pkgver.linux.x86_64.tgz.bin")
noextract=('$pkgname-$pkgver.linux.x86_64.tgz.bin')
sha256sums=('40d7439aef966965fbdd0840d091ea582ddda85c09ef4deea582af7728a8cfad')

prepare() {
	msg2 "Unpacking archive..."
	tail -n +347 "$srcdir/$pkgname-$pkgver.linux.x86_64.tgz.bin" > "$pkgname-$pkgver.linux.x86_64.tgz"

	msg2 "Extracting archive..."
	tar -xf $pkgname-$pkgver.linux.x86_64.tgz
}

package() {
	mkdir -p "$pkgdir/opt"

	msg2 "Copying AnyLogic contents..."
	cp -R "$srcdir/anylogic" "$pkgdir/opt"

	msg2 "Copy AnyLogic start script..."
	install -Dm755 "$srcdir/anylogic/start-anylogic.sh" "$pkgdir/usr/bin/anylogic"

	msg2 "Patching AnyLogic start script..."
	sed "s#./anylogic#/opt/anylogic/anylogic#" -i "$pkgdir/usr/bin/anylogic"

	install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
