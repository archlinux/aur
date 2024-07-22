# Maintainer: Karim Abou Zeid <karim23697 at gmail dot tld>

pkgname=vscode-codicons-git
pkgver=0.0.35.r49.eaa0306
pkgrel=1
pkgdesc="The icon font for Visual Studio Code"
arch=(any)
url="https://microsoft.github.io/vscode-codicons/dist/codicon.html"
license=('custom:Creative Commons Attribution 4.0 International Public License')
makedepends=('git' 'npm')
source=('git+https://github.com/microsoft/vscode-codicons.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/vscode-codicons"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/vscode-codicons"
	npm install
	npm run build
}

package() {
	cd "$srcdir/vscode-codicons"
	install -Dm644 "dist/codicon.ttf" -t "$pkgdir/usr/share/fonts/vscode-codicons" 
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
