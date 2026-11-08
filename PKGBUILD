# Maintainer: tee < teeaur at duck dot com >
pkgname=dearsql-bin
pkgver=0.7.3
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
b2sums=('f09be072749b22bdab6d9c25a32f671102eb7d361963f0a4c50a5170c3f3dfc5e99dd730bd5ec9ff65c20689e254949e8c6f4ddc39c84c1f884924838e644d7f'
        '826b5faf63d8a79308a9c975b915baaafde84f383b4fa00c2ec318ec2945347cd019cdb8e1b0a50887b6c8388d8cd16857e0b8c98c67adfd6666d422c1b6006f'
        'dc1d873dfa2a32909eff289e8f9c5b39646fe717f0d7ff4096a27e30c3cee8694979eca3ff1c24f30fdbfd58d0d73ba2c81c74c616c6422a53b56344ac01f2db')

package() {
    sed -i "s;Exec=.*;Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 dearsql --no-sandbox %U;" \
      io.gitlab.dunkbing.dearsql.desktop
    install -Dm755 DearSQL-$pkgver-x86_64.AppImage "$pkgdir/opt/$pkgname/DearSQL.AppImage"
    install -Dm644 io.gitlab.dunkbing.dearsql.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 dearsql.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.gitlab.dunkbing.dearsql.png"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "$pkgdir/opt/$pkgname/DearSQL.AppImage" "$pkgdir/usr/bin/dearsql"
}
