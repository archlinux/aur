pkgname=arrpc-bun-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="TypeScript/Bun port of arRPC - Open Discord RPC server"
arch=('any')
url="https://github.com/Creationsss/arrpc-bun"
license=('MIT')
depends=('bun-bin')
provides=('arrpc-bun')
conflicts=('arrpc-bun')
source=("arrpc-bun-${pkgver}.tar.gz::https://github.com/Creationsss/arrpc-bun/archive/v${pkgver}.tar.gz")
sha256sums=('fe9c6f39b26bfd5db333a95658ebf3922c1135abe2bdf4f2bde73eddf9ac17f7')

package() {
    cd "${srcdir}/arrpc-bun-v${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/arrpc-bun"

    cp -r src "${pkgdir}/usr/lib/arrpc-bun/"
    cp -r scripts "${pkgdir}/usr/lib/arrpc-bun/"
    install -Dm644 detectable.json "${pkgdir}/usr/lib/arrpc-bun/detectable.json"
    install -Dm644 detectable_fixes.json "${pkgdir}/usr/lib/arrpc-bun/detectable_fixes.json"
    install -Dm644 package.json "${pkgdir}/usr/lib/arrpc-bun/package.json"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/arrpc-bun" << 'EOF'
#!/bin/bash
exec bun run /usr/lib/arrpc-bun/src/index.ts "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/arrpc-bun"
}
