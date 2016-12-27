# Maintainer: T. Jameson Little <t.jameson.little@gmail.com>
pkgname=geckodriver-git
pkgver=v0.11.1.r29.2658357
pkgrel=1
pkgdesc="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers"
arch=(any)
url=""
license=('MPL')
groups=()
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/mozilla/geckodriver.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
    cargo build --release
}

# check() {
# 	cd "$srcdir/${pkgname%-VCS}"
# 	make -k check
# }

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m 755 "${srcdir}/${pkgname%-git}/target/release/${pkgname%-git}" "${pkgdir}/usr/bin/"
}
