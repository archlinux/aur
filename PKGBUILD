# Maintainer: Panda <satodu@github.com>
pkgname=bamboo-end-store-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Modern community store for EndeavourOS and Arch Linux built with NativePHP"
arch=('x86_64')
url="https://github.com/satodu/bamboo-end-store"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
provides=('bamboo-end-store')
conflicts=('bamboo-end-store')
options=('!strip')

source=(
    "${pkgname}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/linux-unpacked.tar.xz"
    "bamboo-end-store.desktop"
    "icon.png"
)

sha256sums=('32f0f740d410581e6623ad2720e73fd98fe1e3c755a6112886c76067c94a3902'
            '6e9e01d7b945b3faeb38f7b5be034d55c41a7e5786405e384646da84322b15be'
            '4ab1f72cee29bcb6bc6fe9081e288f527944c03c4a207cc000fe2258b6e56939')

package() {
    # 1. Cria a pasta em /opt e copia os arquivos extraídos
    install -d "${pkgdir}/opt/${pkgname}"
    cp -rp "${srcdir}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}/"

    # 2. Corrige permissões (essencial para que o usuário consiga ler recursos e bibliotecas)
    chmod -R u+rwX,go+rX "${pkgdir}/opt/${pkgname}"

    # 3. Cria o link simbólico para o executável no /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bamboo-end-store" "${pkgdir}/usr/bin/bamboo-end-store"

    # 4. Menu Desktop
    install -Dm644 "${srcdir}/bamboo-end-store.desktop" "${pkgdir}/usr/share/applications/bamboo-end-store.desktop"

    # 5. Ícone oficial do sistema
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bamboo-end-store.png"
}
