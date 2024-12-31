# Maintainer: Devon T. Bautista <devonb@lanl.gov>
_pkgname=ochami
pkgname="${_pkgname}-git"
pkgver=v0.0.7.r0.ca7625f
pkgrel=1
pkgdesc="Command line interface for OpenCHAMI services"
arch=('aarch64' 'x86_64')
url="https://github.com/OpenCHAMI/${_pkgname}"
license=('MIT')
groups=('openchami')
makedepends=('git' 'go' 'inetutils' 'make' 'scdoc')
optdepends=('bash-completion: for bash completion support'
            'jq: for pretty-printing JSON'
            'zsh-completions: for zsh completion support')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
backup=("etc/${_pkgname}/config.yaml")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="$pkgdir/" prefix=/usr install
}
