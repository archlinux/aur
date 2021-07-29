# Maintainer: Kevin Schoon <kevinschoon@gmail.com>
_pkgname=pomo
pkgname=${_pkgname}-git
pkgver=r135.eb08755
pkgrel=1
pkgdesc='Pomodoro Command Line Interface'
url='https://github.com/kevinschoon/pomo'
arch=(x86_64 aarch64)
license=('MIT')
source=("$pkgname::git+https://github.com/kevinschoon/pomo")
sha512sums=('SKIP')
makedepends=('git' 'go')
conflicts=('pomo')

pkgver() {
    cd ${pkgname}
    printf 'r%s.%s' "$(git rev-list --count HEAD)" \
			"$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}/cmd/${_pkgname}"
	go build -ldflags \
		"-X github.com/kevinschoon/pomo/pkg/internal.Version=${pkgver}" \
		-o ../../../pomo
}

package() {
	install -Dm755 pomo "${pkgdir}/usr/bin/pomo"
}
