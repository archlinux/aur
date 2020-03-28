# Maintainer: Korbinian Schildmann <aur@schildmann.net>

pkgbase=linux-firmware-korbi-para-git
pkgname=(linux-firmware-korbi-para-git)
pkgver=20200328.1
pkgrel=1
pkgdesc="Firmware for korbi's workstation"
makedepends=('git')
arch=('any')
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
source=("${pkgbase}::git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p $pkgdir/usr/lib/firmware/

  #amdgpu
  mkdir $pkgdir/usr/lib/firmware/amdgpu/
  install -m 644 amdgpu/*.bin $pkgdir/usr/lib/firmware/amdgpu/

  #amd-ucode
  mkdir $pkgdir/usr/lib/firmware/amd-ucode/
  install -m 644 amd-ucode/*.bin $pkgdir/usr/lib/firmware/amd-ucode/
  
  #amd
  mkdir $pkgdir/usr/lib/firmware/amd/
  install -m 644 amd/*.sbin $pkgdir/usr/lib/firmware/amd/
  
  #advansys
  mkdir $pkgdir/usr/lib/firmware/advansys/
  install -m 644 advansys/*.bin $pkgdir/usr/lib/firmware/advansys/
  
  #cxgb3
  mkdir $pkgdir/usr/lib/firmware/cxgb3/
  install -m 644 cxgb3/*.bin $pkgdir/usr/lib/firmware/cxgb3/
  
  #cxgb4
  mkdir -p $pkgdir/usr/lib/firmware/cxgb4/configs
  install -m 644 cxgb4/*.* $pkgdir/usr/lib/firmware/cxgb4/
  install -m 644 cxgb4/configs/*.txt $pkgdir/usr/lib/firmware/cxgb4/configs/
  
  #qed
  mkdir $pkgdir/usr/lib/firmware/qed/
  install -m 644 qed/*.bin $pkgdir/usr/lib/firmware/qed/
  
  #ums_eneub6250
  mkdir $pkgdir/usr/lib/firmware/ene-ub6250/
  install -m 644 ene-ub6250/*.bin $pkgdir/usr/lib/firmware/ene-ub6250/
  
  #qla1280
  mkdir $pkgdir/usr/lib/firmware/qlogic/
  install -m 644 qlogic/* $pkgdir/usr/lib/firmware/qlogic/

  #bfa
  install -m 644 cbfw* $pkgdir/usr/lib/firmware/
  install -m 644 ct2fw* $pkgdir/usr/lib/firmware/
  install -m 644 ctfw* $pkgdir/usr/lib/firmware/

  #smsmdtv
  install -m 644 cmmb* $pkgdir/usr/lib/firmware/
  install -m 644 dvb* $pkgdir/usr/lib/firmware/
  install -m 644 isdbt* $pkgdir/usr/lib/firmware/
  install -m 644 sms1xxx* $pkgdir/usr/lib/firmware/
  install -m 644 tdmb* $pkgdir/usr/lib/firmware/

  #qla2xxx
  install -m 644 ql2* $pkgdir/usr/lib/firmware/
}
