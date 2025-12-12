# Maintainer: Bryson Kelly <bryson.dev2011@gmail.com>

pkgname=buf-cli
pkgver=1.5.1
pkgrel=1
pkgdesc="Bootable USB Flasher - Create bootable USB drives from ISO images"
arch=('x86_64')
url="https://github.com/Germ-99/buf"
license=('GPL-3.0-or-later')
depends=('util-linux' 'parted' 'dosfstools' 'ntfs-3g' 'p7zip' 'wget')
makedepends=('gcc' 'make')
optdepends=(
    'grub: BIOS boot support for Windows ISOs'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Germ-99/buf/archive/v${pkgver}.tar.gz")
sha256sums=('e99557db1d50038925d4d33d99dd6d8e4221e2ce3c38dc9dce1aa23e701c1ad5')  

build() {
    cd "${srcdir}/buf-${pkgver}"
    make
}

package() {
    cd "${srcdir}/buf-${pkgver}"
    
    install -Dm755 "buf" "${pkgdir}/usr/bin/buf"
    
    install -Dm644 README.md "${pkgdir}/usr/share/doc/buf-cli/README.md"
    
    # Install license if available
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/buf-cli/LICENSE"
    fi
}
