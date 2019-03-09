# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=zeit-now-bin
pkgver=14.0.3
pkgrel=1
epoch=
pkgdesc="Realtime Global Deployments by Zeit, pre-built binary (always latest version)"
arch=("x86_64")
url="https://zeit.co/now"
# license is according to https://www.npmjs.com/package/now
license=("Apache")
groups=()
depends=("glibc")
makedepends=("gzip")
checkdepends=()
optdepends=()
provides=("zeit-now")
conflicts=("nodejs-now")
replaces=()
backup=()
options=("!strip")
install=
changelog=
# Actually this is just an information about the latest version.
source=("https://github.com/zeit/now-cli/releases/latest")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	# Could not find a way to check version *before* downloading sources,
	# so we fetch version information instead of sources
	# and then download the real binary in build()
	cat latest | grep -o 'tag/[^"]*' | sed 's:tag/::'
}

build() {
	# now really download the source
	curl -L https://github.com/zeit/now-cli/releases/download/${pkgver}/now-linux.gz -o now-linux.gz
	# and unpack it
	gunzip now-linux.gz
	chmod +x now-linux
}

package() {
	install -D now-linux "${pkgdir}/usr/bin/now"
}
