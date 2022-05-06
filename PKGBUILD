pkgname=vscode-node-debug2
pkgver=1.43.0
pkgrel=1
pkgdesc="A VS Code debug adapter that supports debugging Node via the Chrome Debugging Protocol."
url="https://github.com/microsoft/vscode-node-debug2"
arch=('i686' 'x86_64')
license=('MIT')
makedepens=('git' 'npm')
source=(
	"https://github.com/microsoft/vscode-node-debug2/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('3cb1440a381808a04c24b2a164de84e2d08ac5946f01b51ad0e52b4fd9f82cf0')

package() {

	# Copy a startup script to package directory
	mkdir -p "${pkgdir}/usr/lib/${pkgname}/"

	cd ${srcdir}/vscode-node-debug2-${pkgver}

	npm i
	npm run package

	# Copy the app files & dependency modules to package directory
	mkdir -p "${pkgdir}/usr/lib/${pkgname}/"
	cp -r ./* "${pkgdir}/usr/lib/${pkgname}/"

	# Copy a license file to package directory
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove references to $srcdir of node_modules directory
	#grep -l "${srcdir}" -r "${pkgdir}" | xargs sed -i "s#${_git_srcdir}#/usr/lib/${pkgname}#g"
}
