# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname="readpe-git"
pkgver=0.85.1.r5.g967ab57
pkgrel=1
pkgdesc="Command line toolkit to work with and analyze PE (Portable Executables) binaries"
arch=("x86_64")
url="https://github.com/mentebinaria/readpe"
license=("LicenseRef-GPL-2.0-or-later-with-OpenSSL-exception AND LGPL-3.0-or-later")
depends=("openssl")
makedepends=("git")
# TODO(Martin): Remove the "pev" provides when others have switched
conflicts=("readpe" "pev")
provides=("readpe" "pev")
source=("git+https://github.com/mentebinaria/readpe.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --tags | sed -e "s/\([^-]*-g\)/r\1/" -e "s/-/./g" -e "s:^v::g"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make prefix="/usr"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make prefix="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE.OpenSSL -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
