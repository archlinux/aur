# Maintainer: Nixuge

pkgname=cider-polybar
pkgver=1.2.0
pkgrel=1
pkgdesc='A PolyBar custom script to interact with Cider - An open-source, community-oriented Apple Music'
url=https://github.com/tnguye20/cider-polybar
arch=(x86_64)
license=(GNU3)
conflicts=('cider-polybar-bin')
makedepends=('typescript' 'nodejs' 'npm' 'git')
options=(!strip)
source=("git+https://github.com/tnguye20/cider-polybar.git")
sha256sums=('SKIP')
_pkgname="cider-polybar"

build() {
	cd "${srcdir}/${_pkgname}"

	# Install the requirements (pkg & types) to build
	npm install pkg @types/node --save-dev

	# Compile
	tsc -p .
}

package() {
	cd "${srcdir}/${_pkgname}"

	# Install the License
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/cider-polybar/LICENSE"

	# Unset the dev tag 
	unset CIDER_DEV

	# Package with pkg*
	node node_modules/pkg/lib-es5/bin.js . \
		--output "${pkgdir}/usr/local/bin/cider-polybar" \
		--targets node12-linux-x64
}
#*Using node12 since for some weird reason pkg
# doesn't seem to like other versions at all