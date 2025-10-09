# Maintainer: Mikołaj Ziółkowski <mikolajziolkowski504@gmail.com>
pkgname=grub-efi
pkgver=2.12
pkgrel=3
_pkgname='grub'
_vendor='arch'
pkgdesc="Arch-based EFI boot structure using system GRUB (full module support) and grub efi works with bootupd"
arch=('x86_64')
license=('GPL3')
depends=('grub' 'freetype2')
source=()
sha256sums=()

package() {
  # Utwórz katalogi
  mkdir -p "${pkgdir}/usr/lib/efi/grub/${pkgver}-${pkgrel}/EFI/${_vendor}"

  # 🔧 Pobierz wszystkie moduły z systemowego GRUB-a
  grub_modules=$(ls /usr/lib/grub/x86_64-efi/*.mod | sed 's|.*/||;s|\.mod$||' | tr '\n' ' ')

  # 🧩 Utworzenie grubx64.efi z pełnym zestawem modułów
  grub-mkimage -O x86_64-efi \
    -o "${pkgdir}/usr/lib/efi/grub/${pkgver}-${pkgrel}/EFI/${_vendor}/grubx64.efi" \
    -p /grub \
    $grub_modules
}
