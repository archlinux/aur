# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>
# Maintainer: Asuka Minato

pkgname=notion-app-electron
pkgver="2.2.4"
pkgrel=2
pkgdesc="The all-in-one workspace for your notes and tasks, use system electron"
arch=('x86_64')
url="https://www.notion.so/"
license=('MIT')
install=.install
depends=(bash
	electron
	gcc-libs
	glibc
)

provides=('notion-app')
conflicts=('notion-app')

source_x86_64=(
	".install"
	"notion-app.sh"
	"$pkgname.desktop"
	"Notion Setup $pkgver.exe::https://www.notion.so/desktop/windows/download"
	"https://github.com/WiseLibs/better-sqlite3/releases/download/v9.0.0/better-sqlite3-v9.0.0-electron-v116-linux-x64.tar.gz")
sha256sums_x86_64=('3b2e5a58251f64a4ef5b1be4b7b7fc104e488dac21e944d89295b9454ec9ae79'
                   '14bb91bb8c48cca21215a45a5f34762eef1dffbc8b5f968025c92552afc5f5ae'
                   'e31c1c1a97414b879658890563de10a2200841f1b06200dbfc00e054b625319c'
                   'ba18604307593e8bfa4f90d1bc6cee56f3434e41f8d5a3edfc998277bd5ee18d'
                   '38848d85c41116b419b13818ab934d6ec5c5c563f9623f1cf8a958809ea92c7d')

prepare() {
	find $srcdir -name "better*.node" -print -path "*/node_modules/*" -exec install -Dm644 build/Release/better_sqlite3.node {} \;
}

package() {
	install -d $pkgdir/opt/Notion/
	cp -av $srcdir/resources $pkgdir/opt/Notion/

	install -vDm755 notion-app.sh $pkgdir/usr/bin/notion-app
	install -vDm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
