# Maintainer: Devon T. Bautista <devonb@lanl.gov>
pkgname=ochami-git
pkgver=v0.0.5.r0.g2a54540
pkgrel=1
pkgdesc="Command line interface for OpenCHAMI services"
arch=('aarch64' 'x86_64')
url='https://github.com/OpenCHAMI/ochami'
license=('MIT')
groups=('openchami')
makedepends=('git' 'go' 'make' 'scdoc')
optdepends=('bash-completion: for bash completion support'
            'jq: for pretty-printing JSON'
            'zsh-completions: for zsh completion support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
backup=("etc/${pkgname}/config.yaml")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
