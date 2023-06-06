pkgname=opencore-efi
pkgver=0.9.2
pkgrel=1
_mode='RELEASE'
# _mode='DEBUG'
pkgdesc='OpenCore bootloader to provide supplemental functionality for Apple-specific UEFI drivers'
url='https://github.com/acidanthera/OpenCorePkg'
arch=('x86_64' 'i686')
license=('BSD')
source=("https://github.com/acidanthera/OpenCorePkg/releases/download/$pkgver/OpenCore-$pkgver-$_mode.zip")
sha256sums=('793867fac125cfae7d6baabed02e6ceb6507583df7241002210eec0d84c35d9d')

package(){
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    architecture=X64
  else
    architecture=IA32
  fi

  install -d "$pkgdir/boot/EFI"
  cp -a "$srcdir/$architecture/EFI/OC" "$pkgdir/boot/EFI/"

  install -D "$srcdir/$architecture/EFI/BOOT/BOOTx64.efi" "$pkgdir/usr/lib/$pkgname/EFI/BOOT/BOOTx64.efi"

  install -d "$pkgdir/usr/share/doc"
  cp -a "$srcdir/Docs" "$pkgdir/usr/share/doc/$pkgname"
}
