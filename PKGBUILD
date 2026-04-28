# Maintainer: schultz-dev0 <your.email@example.com>
pkgname=rusty_keys-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A mechanical keyboard sound emulator (GTK4/Libadwaita)"
arch=('x86_64')
url="https://github.com/schultz-dev0/RustyKeys"
license=('MIT')
depends=('gtk4' 'libadwaita' 'alsa-lib')
provides=('rusty_keys')
conflicts=('rusty_keys')
source=("rusty_keys::${url}/releases/download/v${pkgver}/rusty_keys"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('697ae5e4c2151b2788a43a96147a1a99e9e4e0272d08694e5370e50c4ec2015a'
            '48b47d04aec96300e04c151303b87e9600207e1c4e430b2e98a881366d455df8')

package() {
    install -Dm755 "${srcdir}/rusty_keys" "${pkgdir}/usr/bin/rusty_keys"
    
    local src_dir="RustyKeys-${pkgver}"
    install -d "${pkgdir}/usr/share/rusty_keys/assets"
    cp -r "${srcdir}/${src_dir}/assets/"* "${pkgdir}/usr/share/rusty_keys/assets/"
    
    if [ -f "${srcdir}/${src_dir}/LICENSE" ]; then
        install -Dm644 "${srcdir}/${src_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
