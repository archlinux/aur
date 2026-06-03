# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=7.1.8
pkgrel=1
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux' 'xz' 'zstd')
makedepends=('gcc' 'make')
optdepends=(
    'ntfs-3g: NTFS formatting for Windows live USB creation (writes use the ntfs3 kernel driver)'
    'dosfstools: FAT32 formatting for Windows live USB creation'
    'parted: GPT partition layout for Windows live USB creation'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('52d7105c2837fb99ed23dbe28f4aa9c1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the binary
    install -Dm755 isocmd "${pkgdir}/usr/bin/isocmd"

    # Install the man page
    install -Dm644 "man/isocmd.1" "${pkgdir}/usr/share/man/man1/isocmd.1"
}
