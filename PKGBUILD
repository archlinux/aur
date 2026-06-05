# Maintainer: Your Name <your-email@provider.com>
pkgname=openrc-manager-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern Qt6 C++ graphical user interface to manage OpenRC services and view boot logs in real-time"
arch=('x86_64' 'aarch64')
url="https://github.com/nightsidearch"
license=('GPL3')
depends=('qt6-base' 'kde-cli-tools')
makedepends=('qt6-base' 'pkgconf' 'cmake')
# Mudamos a fonte para baixar direto do link oficial do seu GitHub
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nightsidearch/openrc-manager-gui/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('7752c53b6a2018aa2bba3a3f007e644178e33560952a856a175bed1a29a546a8')

build() {
    # O GitHub extrai os arquivos dentro de uma pasta com o nome do projeto e versão
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Instala o executável compilado
    install -Dm755 build/openrc-manager-gui "$pkgdir/usr/bin/openrc-manager-gui"
    
    # Instala o ícone
    install -Dm644 openrc-manager-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrc-manager-gui.svg"
    
    # Instala o lançador do menu do KDE (.desktop)
    install -Dm644 openrc-manager-gui.desktop "$pkgdir/usr/share/applications/openrc-manager-gui.desktop"
    
    # Instalar o metadado pkgconfig (.pc)
    install -Dm644 openrc-manager-gui.pc "$pkgdir/usr/lib/pkgconfig/openrc-manager-gui.pc"
}
