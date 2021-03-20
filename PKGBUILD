# Maintainer: Maximilian Moser <maximilian.moser at tuwien dot ac dot at>

pkgname=lightdm-elephant-greeter-git
pkgver=r10.bcd44ba
pkgrel=1
pkgdesc="Simple LightDM greeter that does not need X11"
arch=("any")
url="https://github.com/max-moser/elephant-greeter"
license=("MIT")
depends=("lightdm" "python>=3.8" "cage")
makedepends=("git")
optdepends=()
provides=("lightdm-elephant-greeter")
conflicts=()
replaces=()
source=("git+https://github.com/max-moser/elephant-greeter.git")
sha256sums=("SKIP")

pkgver() {
	# create a package version from git
	cd elephant-greeter
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	: # nothing to prepare (no patches, ...)
}

build() {
	: # nothing to compile (it's python)
}

check() {
	: # no tests to run
}

package() {
	# install the package
	cd elephant-greeter
	make PKG_PREFIX="${pkgdir}" INSTALL_PATH="/usr" CONFIG_PATH="/etc" install
	install -Dpm 644 LICENSE -t "${pkgdir}/usr/share/licenses/lightdm-elephant-greeter/"
}

