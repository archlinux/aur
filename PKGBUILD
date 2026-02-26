pkgname='relayfsd'
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool that monitors a dir and automatically uploads files to another dir"
arch=('x86_64')
url="https://github.com/Almutairi0/relayfsd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("git+${url}.git")
conflicts=('python-relayfsd')
replaces=('python-relayfsd')
provides=('relayfsd')
sha256sums=('SKIP')

build() {
    cd "${srcdir}/relayfsd/src"
    go build -o relayfsd .
}

package() {
    cd "${srcdir}/relayfsd/src"

    # Install binary
    install -Dm755 relayfsd "${pkgdir}/usr/bin/relayfsd"

    # Install license
    install -Dm644 "${srcdir}/relayfsd/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install readme
    install -Dm644 "${srcdir}/relayfsd/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install systemd service
    #install -Dm644 "${srcdir}/relayfsd/relayfsd.service" "${pkgdir}/usr/lib/systemd/user/relayfsd.service"
}
