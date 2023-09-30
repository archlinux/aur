# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

_pkgname='rofi-rbw'
pkgname="${_pkgname}-git"
pkgver=1.2.0.r3.gce65e72
pkgrel=1
pkgdesc='Rofi frontend for Bitwarden'
arch=('x86_64')
url='https://github.com/fdw/rofi-rbw'
license=('MIT')
makedepends=('git' 'python-pip')
depends=('rbw' 'python' 'python-configargparse')
optdepends=('rofi: rofi frontend' 
            'wofi: wofi frontend'
            'xdotool: for autofill on X11'
            'wtype: for autofill on Wayland'
            'ydotool: for autofill on Wayland'
            'dotool: for autofill on X11 and Wayland'
            'xclip: for copying passwords to clipboard on X11'
            'xsel: for copying passwords to clipboard on X11'
            'wl-clipboard: for copying passwords to clipboard on Wayland')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  pip install --isolated --no-deps --ignore-installed --root="${pkgdir}" .
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 "docs/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
}
