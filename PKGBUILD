# Maintainer: Youcef <youcef.nafa@gmail.com>

pkgname=openusage.sh
pkgver=0.25.0
pkgrel=1
pkgdesc='Terminal-first local quota and usage tracking dashboard for AI coding tools'
arch=('x86_64')
url='https://github.com/janekbaraniewski/openusage'
license=('MIT')
depends=('glibc')
source=("https://github.com/janekbaraniewski/openusage/releases/download/v${pkgver}/openusage_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5013e4b6bb6f120d53f4d35e74a273787b0ad2b26868c927657f7b3ec9dad68f')

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
