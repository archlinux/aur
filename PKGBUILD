# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=failing-disk-reporter
pkgver=0.5.0
pkgrel=1
pkgdesc="Gene counter and profiler."
arch=("x86_64")
url="https://github.com/vejnar/failing-disk-reporter"
license=("MPLv2")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/vejnar/failing-disk-reporter/archive/v${pkgver}.tar.gz" )
sha1sums=("db76870971ac31633195333b7f2808a32743df67")

build() {
    cd "$srcdir/failing-disk-reporter-${pkgver}"
    export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin" CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build ./cmd/...
}

package() {
    cd "$srcdir/failing-disk-reporter-${pkgver}"
    install -Dm 755 fdr -t "${pkgdir}/usr/bin"
    install -Dm 644 config/fdr.toml -t "${pkgdir}/etc"
    install -Dm 644 systemd/failing-disk-reporter.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 systemd/failing-disk-reporter.timer -t "${pkgdir}/usr/lib/systemd/system"
}
