pkgname=opencore-efi
pkgver=0.7.5
pkgrel=1
_mode='RELEASE'
# _mode='DEBUG'
pkgdesc='OpenCore bootloader to provide supplemental functionality for Apple-specific UEFI drivers'
url='https://github.com/acidanthera/OpenCorePkg'
arch=('x86_64' 'i686')
license=('BSD')
source=("https://github.com/acidanthera/OpenCorePkg/releases/download/$pkgver/OpenCore-$pkgver-$_mode.zip")
sha256sums=('57480902cc78120fb2c09ba7dda3730862bd59924e9b227933186195e51e148f')

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
