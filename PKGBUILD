# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: wget
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.82
pkgrel=2
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64 armv6h aarch64)
url="https://www.hamrick.com/"
license=('custom')
depends=(gtk2 libsm libusb-compat)
options=(!strip) # required to accept registration details
source=(
    "vuescan-LICENSE.txt"
    "ocr_bg-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_bg.bin"
    "ocr_ca-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_ca.bin"
    "ocr_zh-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_zh.bin"
    "ocr_tw-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_tw.bin"
    "ocr_cs-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_cs.bin"
    "ocr_da-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_da.bin"
    "ocr_nl-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_nl.bin"
    "ocr_fi-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_fi.bin"
    "ocr_fr-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_fr.bin"
    "ocr_de-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_de.bin"
    "ocr_el-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_el.bin"
    "ocr_hu-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_hu.bin"
    "ocr_id-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_id.bin"
    "ocr_it-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_it.bin"
    "ocr_ja-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_ja.bin"
    "ocr_ko-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_ko.bin"
    "ocr_lv-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_lv.bin"
    "ocr_lt-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_lt.bin"
    "ocr_no-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_no.bin"
    "ocr_pl-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_pl.bin"
    "ocr_pt-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_pt.bin"
    "ocr_ro-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_ro.bin"
    "ocr_ru-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_ru.bin"
    "ocr_sr-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_sr.bin"
    "ocr_sk-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_sk.bin"
    "ocr_sl-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_sl.bin"
    "ocr_es-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_es.bin"
    "ocr_sv-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_sv.bin"
    "ocr_th-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_th.bin"
    "ocr_tl-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_tl.bin"
    "ocr_tr-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_tr.bin"
    "ocr_uk-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_uk.bin"
    "ocr_vi-$(date +%F-%H).bin::https://www.hamrick.com/files/ocr_vi.bin"
)
source_i686=("vuescan-x32-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex3297.rpm")
source_x86_64=("vuescan-x64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex6497.rpm")
source_aarch64=("vuescan-arm64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuea6497.rpm")
# To recompute digests for ocr_* files using the same ordering as the Hamrick
# website, use this:
# for i in $(grep  ocr_ PKGBUILD | grep http | cut -d '/' -f 5); do echo "'"$(sha256sum "$i" | cut -d ' ' -f 1)"'"; done
# But we are skipping them
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
  printf "%s" "$(wget -qO- https://www.hamrick.com/alternate-versions.html | egrep '<a href.*[0-9]+\.[0-9]+' | head -1 | sed -E 's/^.*([0-9]+[.][0-9]+[.][0-9]+).*$/\1/')"
}

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr

  # ocr files need to be alongside the vuescan executable. Solution: move the
  # vuescan executable to lib and symlink /usr/bin/vuescan to the executable
  # now being in lib.
  install -dm755 "${pkgdir}/usr/lib/vuescan"
  mv "${pkgdir}"/usr/bin/* "${pkgdir}/usr/lib/vuescan"
  ln -s /usr/lib/vuescan/vuescan "${pkgdir}/usr/bin/vuescan"


  cd "${pkgdir}/usr/lib/vuescan"
  # Copy the ocr_* files
  cp "${srcdir}"/ocr_*$(date +%F-%H).bin ./
  # Remove date
  for i in ./ocr_*$(date +%F-%H).bin; do
    # Remove date suffix in the filename like ocr_fr-2022-03-28-00.bin
    mv "$i" "${i/%-$(date +%F-%H).bin/.bin}"
    i="${i/%-$(date +%F-%H).bin/.bin}"
  done

  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
