# Maintainer Mircea Mihalea <mircea at mihalea dot ro>

pkgname=bitwarden-pyro-git
pkgver=v1.0.0.r0.g22284b8
pkgrel=2
pkgdesc="Bitwarden python interface built with Rofi"
url="https://github.com/mihalea/bitwarden-pyro"
depends=('python' 'python-yaml' 'keyutils' 'rofi' 'libnotify' 'bitwarden-cli')
makedepends=('python-setuptools')
optdepends=('xdotool: Provide auto typing for X11'
						'ydotool-git: Provide auto typing for Wayland'
						'xclip: Provide clipboard interaction with X11'
						'xorg-xset: Alternative for clipoard interaction with X11'
						'wl-clipboard: Provide clipboard interaction with Wayland')
license=('MIT')
arch=('any')
provides=('bwpyro')
conflicts=('bwpyro')
source=("git+https://github.com/mihalea/${pkgname%-git}.git#tag=v1.0.0")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
