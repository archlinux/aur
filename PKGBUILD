# Maintainer: Alfred Jophy alfredjophy <at> protonmail <dot> com
# Maintainer: Cullen Ross <cullenrss at gmail.com>
# Contributer: Alexis Viguié <net at siphonay.fr>
_name=farge
pkgname="${_name}-git"
pkgver=r56.eadb483
pkgrel=2
pkgdesc="Click on a pixel on your screen and show its color value"
arch=('any')
url="https://github.com/sdushantha/${_name}"
license=('MIT')
depends=('bash' 'imagemagick' 'feh' )
makedepends=('git')
optdepends=('mpv: alternative image viewer'
			'sxiv: alternate image viewer'
			'colorpicker-ym1234-git: for X11 support'
			'wl-clipboard: for wayland support'
			'grim: for wayland support'
			'slurp: for wayland support'
			)
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_name}"
}

build() {
	cd "${srcdir}/${_name}"
	chmod 755 "${_name}"
}

package() {
	cd "${srcdir}/${_name}"
	mkdir -p "${pkgdir}/usr/bin"
	make DEST=${pkgdir}/usr/bin install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

