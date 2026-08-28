# Maintainer: Muhammad Dhiyaul Atha <bangkah@aur>

pkgname=atha
pkgver=2.2.3
pkgrel=1
pkgdesc="Simple and fast Arch Linux package manager wrapper built on top of pacman"
arch=('any')
url="https://github.com/Bangkah/Atha"
license=('MIT')
depends=(
    'bash'
    'pacman'
    'sudo'
    'git'
    'pacman-contrib' # Untuk fitur checkupdates
    'curl'           # Untuk fitur AUR API fallback
    'jq'             # Untuk memparsing JSON dari AUR API
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bangkah/Atha/archive/refs/tags/v${pkgver}.tar.gz")
# Jangan gunakan SKIP untuk rilis spesifik. 
# Jalankan perintah `updpkgsums` di terminal untuk mengisi hash ini secara otomatis.
sha256sums=('INSERT_ACTUAL_SHA256SUM_HERE')

package() {
    cd "Atha-${pkgver}"

    # Instalasi executable utama
    install -Dm755 atha "${pkgdir}/usr/bin/atha"

    # Instalasi modul commands
    install -d "${pkgdir}/usr/lib/atha"
    cp -dr --no-preserve=ownership commands "${pkgdir}/usr/lib/atha/"

    # Instalasi lisensi
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}