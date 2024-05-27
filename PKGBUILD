# Maintainer:  dreick
# Contributor: Ismael Castiñeira (https://aur.archlinux.org/account/bibaheu)

_pkgname=plop-bootmanager
pkgname="${_pkgname}"
epoch=0
pkgver=5.0.15
pkgrel=2
pkgdesc="Bootloader that can boot from USB and CDROM on old machines without BIOS support"
arch=(
  'i686'
  'x86_64'
)
url="https://www.plop.at/en/bootmanagers.html"
license=('custom:freeware-nosold-by')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(
  "grub: To add ${_pkgname} to the GRUB boot menu."
)
provides=(
  "plpbt=${pkgver}"
  "${_pkgname}-5=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
  "${_pkgname}-5-doc=${pkgver}"
)
conflicts=(
  "plpbt"
  "${_pkgname}-5"
  "${_pkgname}-doc"
  "${_pkgname}-5-doc"
)
replaces=()
backup=(
  "boot/EFI/GRUB4DOS/menu.lst"
)
options=()
source=(
    "https://download.plop.at/files/bootmngr/plpbt-${pkgver}.zip"
    "https://download.plop.at/files/bootmngr/plpbtrom-0.6.zip"
    "https://download.plop.at/files/bootmngr/plpbt-createiso.zip"
    "https://download.plop.at/files/bootmngr/plpcfgbt-0.11.zip"
    "https://download.plop.at/files/bootmngr/plpdisd-0.2.zip"
    "https://download.plop.at/files/bootmngr/plpchk-0.1.zip"
    "https://download.plop.at/files/bootmngr/plpmkboot-0.1.zip"
    "${_pkgname}-full.html::https://www.plop.at/en/bootmanager/full.html"
    "80_plopboot"
)
sha256sums=(
  '641a8ccf13b1efb5e9021bd5b801938e6f071ed3f59c41e238e96630803fbb08'  # plpbt-${pkgver}.zip
  '5ae2ec56e9bb727606a9ec0332530b44938be3543385cac7cf156227e9d36a96'  # plpbtrom-0.6.zip
  '5d9ce26aeb36a28864f55a996e5f1f2921ae1db0d2df2eca0337af4ee9bd460f'  # plpbt-createiso.zip
  '7d8806d8aaca245d2ad052905eb5a8c594c25f6b16e42d97777a1dde7ad223da'  # plpcfgbt-0.11.zip
  '1616f8aa4f34ab819c7e556dd92c8485a04929536be2bacd0bf73449be16b2c6'  # plpdisd-0.2.zip
  '9e9d1e06e8be5149a308bbe99c04e72623832a0adb911cba9ec1cffe111f8d4c'  # plpchk-0.1.zip
  '02725ce376a988da98959d4d9231c84e381606ba02145a7540eca5b58852415e'  # plpmkboot-0.1.zip
  'dafbc58c842cdf040febb5602eda44c3b024bb52d318a97731ee556174723026'  # full.html
  '4a761b15a8916ab6106f53b7eb4a2f5f05f5b1d80b69f38d45d38ff7b3dded12'  # 80_plopboot
)
noextract=()
validpgpkeys=()


package() {
  cd "plpbt-${pkgver}"
  for _img in plpbt.bin plpbt.img plpbt.iso; do
    install -Dm644 "${srcdir}/plpbt-${pkgver}/${_img}" "$pkgdir/boot/plop/${_img}"
  done


  install -Dvm755 "${srcdir}/80_plopboot" "$pkgdir/etc/grub.d/80_plopboot"

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}/doc"
  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}/doc/website"
  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}/tools"
  install -Dvm644 "${srcdir}/plpbt-${pkgver}/1README.TXT"  "${pkgdir}/usr/share/doc/${_pkgname}/1README.TXT"
  cp -rv          "${srcdir}/plpbt-${pkgver}/doc"/*        "${pkgdir}/usr/share/doc/${_pkgname}/doc"/
  install -Dvm644 "${srcdir}/${_pkgname}-full.html"        "${pkgdir}/usr/share/doc/${_pkgname}/doc/website/full.html"

  for _tool in "plpbt-${pkgver}" "plpbt-createiso" "plpbtrom-0.6" "plpcfgbt-0.11" "plpchk-0.1" "plpdisd-0.2" "plpmkboot-0.1"; do
    cp -rv "${srcdir}/${_tool}" "${pkgdir}/usr/share/doc/${_pkgname}/tools"/
  done

  install -Dm644 licence.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  ln -svr "$pkgdir/usr/share/licenses/$pkgname/license.txt" "${pkgdir}/usr/share/doc/${_pkgname}/license.txt"
}
