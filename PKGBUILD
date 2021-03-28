# Maintainer: nullobsi <me at nullob dot si>

pkgname=pass-secrets-git
pkgver=r38.525609b
pkgrel=1
pkgdesc="Freedesktop secrets provider that uses pass as a backend"
arch=('x86_64')
url="https://github.com/nullobsi/pass-secrets"
license=('GPL3')
groups=()
depends=('sdbus-cpp' 'pass')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}" "org.freedesktop.secrets" "gnome-keyring")
conflicts=("${pkgname%-git}" "gnome-keyring")
source=('git+https://github.com/nullobsi/pass-secrets.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
