# Maintainer: Martin Rys <rys.pw/contact>

pkgname=video2midi-git
pkgver=0.4.7.r3.05f2ff1
pkgrel=1
pkgdesc='Convert Synthesia YouTube videos to MIDI'
arch=('any')
url='https://github.com/svsdval/video2midi'
license=('GPL3')
depends=('hdf5' 'python-midiutil' 'python-opencv' 'python-opengl' 'python-pygame')
#optdepends=('')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('video2midi'::'git+https://github.com/svsdval/video2midi.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

package() {
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 v2m.py "${pkgdir}/usr/bin/v2m"
	install -d "${pkgdir}${site_packages}/video2midi"
	for file in video2midi/*; do
		install -Dm644 "${file}" "${pkgdir}${site_packages}/video2midi/$(basename "${file}")"
	done
}
