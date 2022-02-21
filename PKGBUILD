# Maintainer: BrainDamage
# Contributor: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname_=mididings
pkgname=${pkgname_}-git
pkgver=r717.0582955
pkgrel=1
pkgdesc="A MIDI router and processor based on Python, supporting ALSA and JACK MIDI (python3 patched)"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/mididings/"
license=('GPL')
depends=('boost-libs' 'python-decorator' 'jack')
makedepends=('boost')
provides=("${pkgname_}")
conflicts=("${pkgname_}")
optdepends=('python-dbus: to send DBUS messages'
            'python-pyliblo: to send or receive OSC messages'
            'python-pyinotify: to automatically restart when a script changes'
            'python-xdg: so mididings knows where to look for config files'
            'tk: for the livedings GUI')
source=("${pkgname}::git+https://github.com/ponderworthy/mididings")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
	# documentation generation not functional
	# cd "${srcdir}/${pkgname}/doc"
	# make
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --skip-build --prefix=/usr --root="${pkgdir}"

	# manual installation of raw docs
	cd "${srcdir}/${pkgname}/doc"
	find . -exec install -Dvm 644 {} "${pkgdir}/usr/share/doc/${pkgname_}/{}" \;
}
