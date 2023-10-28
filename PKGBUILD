# Maintainer: Asuka Minato
# Maintainer: Kid <hi at xuann dot wang>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=2.2.4
pkgrel=3
pkgdesc="Your connected workspace for wiki, docs & projects (using system Electron)"
arch=(x86_64)
url="https://www.notion.so/desktop"
license=(custom:notion-app)
depends=(electron)
install=notion-app.install

source=("https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe"
	    "https://github.com/WiseLibs/better-sqlite3/releases/download/v9.0.0/better-sqlite3-v9.0.0-electron-v116-linux-x64.tar.gz"
	    notion-app.sh
	    notion-app.desktop
	    notion-app.png)
sha256sums=('ba18604307593e8bfa4f90d1bc6cee56f3434e41f8d5a3edfc998277bd5ee18d'
            '38848d85c41116b419b13818ab934d6ec5c5c563f9623f1cf8a958809ea92c7d'
            'c26d4f3a9b7940c0690a4fc24a041798bca3ebe80f0d501f921afec74c2ec34d'
            'f13de2b42149ef88ab55a4b2d3d0e71756a73d18db608f33e423c9b4c9c010eb'
            '531810641786112d41f5780044db39aa9f93945dfa80c05bf40edb3b4f9d6357')

package() {
	install -Dm644 $srcdir/resources/app.asar -t $pkgdir/usr/lib/notion-app
	install -Dm644 $srcdir/build/Release/better_sqlite3.node -t $pkgdir/usr/lib/notion-app/app.asar.unpacked/node_modules/better-sqlite3/build/Release

	# Launcher
	install -Dm755 notion-app.sh $pkgdir/usr/bin/notion-app

	# Desktop entry
	install -Dm644 notion-app.desktop -t $pkgdir/usr/share/applications

	# Icon
	install -Dm644 notion-app.png -t $pkgdir/usr/share/icons/hicolor/512x512/apps
}
