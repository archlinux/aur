_pkgname=ya4r
pkgname="ya4r"
pkgver=0.2.2
pkgrel=1
pkgdesc="Yet Another 4Chan Reader - Built using the Electron framework."
arch=('x86_64' 'i686')
license=('GPL3')
url="https://github.com/0v3rl0w/${_pkgname}"
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2' 'sudo')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')

_archive="${_pkgname}-${pkgver}"
source=(
	"${_archive}.tar.gz::$url/archive/${pkgver}.tar.gz"
)

sha256sums=('63b89c4d546200b3a9331cff359cc834a4a901d3aac7efb15502a09f204fe4d5')

prepare() {
	if [ -f /opt/Ya4r ]; then
		sudo rm -rf "/usr/share/applications/ya4r.desktop"
		sudo rm -rf "/usr/share/licenses/${pkgname}/LICENSE"
		sudo rm -rf "/opt/Ya4r"
	else 
		echo "OK"
	fi
}

package() {
	sudo install -D -m644 "${srcdir}/Ya4r-${pkgver}/ya4r.desktop" "/usr/share/applications/ya4r.desktop"

	sudo install -D -m644 "${srcdir}/Ya4r-${pkgver}/LICENSE" "/usr/share/licenses/${pkgname}/LICENSE"

	sudo mv "${srcdir}/Ya4r-${pkgver}" "/opt/Ya4r"

	rm -rf "${srcdir}"
}

