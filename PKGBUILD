# Maintainer information
maintainer="Hamdy Abou El Anein <hamdy.aea@protonmail.com>"

# Package metadata
pkgname=arch-certwatch
pkgver=0.1.1
pkgrel=1
pkgdesc="Small daemon to scan TLS certificates and warn before expiry. Maintainer: Hamdy Abou El Anein"
arch=('x86_64')
url="https://github.com/hamdyaea/arch-certwatch"
license=('GPLv3')
depends=()
makedepends=('go' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c967994fb07fa02233225ed251a27f6d830edb3a478ab359844d0ce3125b0942')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o arch-certwatch ./...
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Binary
    install -Dm755 arch-certwatch "$pkgdir/usr/bin/arch-certwatch"
    
    # Systemd service
    install -Dm644 arch-certwatch.service "$pkgdir/usr/lib/systemd/system/arch-certwatch.service"
    
    # Default config
    install -Dm644 config.yaml "$pkgdir/etc/arch-certwatch/config.yaml"
    
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

