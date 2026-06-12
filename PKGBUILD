# Maintainer: tee < teeaur at duck dot com >
pkgname=dearsql-bin
pkgver=0.4.10
pkgrel=1
pkgdesc="A simple, cross-platform database client built with Dear ImGui"
arch=(x86_64)
url="https://dearsql.dev"
license=('LicenseRef-FSL')
provides=('dearsql')
conflicts=('dearsql')
options=(!strip)
_src="https://github.com/dunkbing/dearsql"
source=("DearSQL-$pkgver-x86_64.AppImage::$_src/releases/download/v$pkgver/DearSQL-x86_64.AppImage"
"$_src/raw/v$pkgver/packaging/io.gitlab.dunkbing.dearsql.desktop"
"dearsql.png::$_src/raw/v$pkgver/assets/appicon.png")
sha256sums=('83a673164da28e80e3d3ded2b8ea7946902a733f41759338e0f33d713b040ea8'
            '8d1eb52592409db0b26abb3def7be743c926ceb4212fddffdfb13d4a5f72420c'
            '03e01e1fe765e93f167d0870e010cd43d4fcb24fe103f7fadf50a6f540828167')

package() {
    sed -i "s;Exec=.*;Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 dearsql --no-sandbox %U;" \
      io.gitlab.dunkbing.dearsql.desktop
    install -Dm755 DearSQL-$pkgver-x86_64.AppImage "$pkgdir/opt/$pkgname/DearSQL.AppImage"
    install -Dm644 io.gitlab.dunkbing.dearsql.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 dearsql.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.gitlab.dunkbing.dearsql.png"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "$pkgdir/opt/$pkgname/DearSQL.AppImage" "$pkgdir/usr/bin/dearsql"
}
