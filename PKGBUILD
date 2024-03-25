# Maintainer: Sergio Callegari <sergio.callegari@gmail.com>
pkgname=unison-upstream-bin
_pkgname=unison
pkgver=2.53.4
pkgrel=1
pkgdesc="File-synchronization tool, upstream provided binaries"
arch=(x86_64)
url="https://github.com/bcpierce00/unison/"
license=('GPL2')
optdepends=('gtk3: graphical interface')
provides=(unison)
conflicts=(unison)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-ubuntu-$arch.tar.gz"
	"$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        "$_pkgname.desktop"
        "$_pkgname.1.gz")
sha256sums=('7213a6ab4584fc00de52e8675209c28cfbc68d8c1c86cc463df6afb016ad284a'
            'd19e4293013581dbc4d149aef89b34c76221efcbd873c7aa5193de489addb85a'
            'e53bd5add9a448f2eb4fd06bb84f3122be20575a8574cfd04ba4c6af984e3382'
            '8de06857315dfb8d87d4affd2c6a03387c4f904a3ff1468a1eed97bafe052356')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "bin/$_pkgname"{,-fsmonitor,-gui}
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_pkgname.desktop"
    install -Dm0644 -t "$pkgdir/usr/share/man/man1/" *.1
    install -Dm0644 -t "$pkgdir/usr/share/doc/licences/$_pkgname" "LICENSE"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname" "$_pkgname"-manual.*
    cd "$_pkgname-$pkgver"
    install -Dm0644 icons/U.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    for i in 16 24 32 48 256; do
 	install -Dm0644 "icons/U.${i}x${i}x16m.png" \
		"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
    done
}
