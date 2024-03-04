# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=mailpit
pkgver=1.14.1
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
sha256sums=('38e6439c957189383a4c6a9b0778f5ea2d1ca7e040b743f75ada34c05840bc81'
            '602494cc3d28d58fa430ec3c53fd66e694db9faa87e98e45effe00a844affc4b')
