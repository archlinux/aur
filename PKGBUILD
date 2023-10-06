# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=mailpit
pkgver=1.9.6
pkgrel=1
pkgdesc="Web and API based SMTP testing"
arch=("x86_64" "arm64")
license=("MIT")
url="https://github.com/axllent/mailpit"

makedepends=("git" "npm" "go")
optdepends=("systemd")

source=(
	"https://github.com/axllent/mailpit/archive/refs/tags/v${pkgver}.tar.gz"
	"mailpit.service"
)

build() {
	cd "${srcdir}/mailpit-${pkgver}"
	npm install
	npm run build
	go build -ldflags "-s -w"
}

package() {
    cd "${srcdir}"
    install -D -m644 ${srcdir}/mailpit.service ${pkgdir}/usr/lib/systemd/system/mailpit.service
    cd "mailpit-${pkgver}"
    install -D -m755 mailpit ${pkgdir}/usr/bin/mailpit
}

sha256sums=('66eb9cff9b5bfe7740fabf6304dfc4577746ce5b782e8868f5043440fc4a122f'
            '602494cc3d28d58fa430ec3c53fd66e694db9faa87e98e45effe00a844affc4b')
