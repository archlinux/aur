# Maintainer: Youcef <youcef.nafa@gmail.com>

pkgname=openusage.sh
pkgver=0.26.0
pkgrel=1
pkgdesc='Terminal-first local quota and usage tracking dashboard for AI coding tools'
arch=('x86_64')
url='https://github.com/janekbaraniewski/openusage'
license=('MIT')
depends=('glibc')
source=("https://github.com/janekbaraniewski/openusage/releases/download/v${pkgver}/openusage_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1b5094acb5ffb5b7ef5123c0e598e7d20fe21b4d0f09a5cedde82d0ea175e5df')

prepare() {
    cd "$srcdir"
    # Nothing to do — upstream ships a prebuilt binary.
    # Verify the expected files exist before proceeding.
    [[ -f openusage ]] || { echo "error: openusage binary not found in source" >&2; return 1; }
}

build() {
    cd "$srcdir"
    # Prebuilt binary — no compilation needed.
    # Ensure it is executable in case the tarball permissions are off.
    chmod +x openusage
}

package() {
    cd "$srcdir"

    # Main binary
    install -Dm755 openusage "$pkgdir/usr/bin/openusage"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 configs/example_settings.json "$pkgdir/usr/share/doc/$pkgname/example_settings.json"

    # License (MIT)
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
