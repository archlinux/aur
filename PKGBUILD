# Maintainer: Damir Perisa <damir pünktli perisa at gmail com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Vinzenz Vietzke <vinz@vinzv.de>

pkgname="eci-icc"
pkgver=2020
pkgrel=2
pkgdesc="ICC profiles from ECI (European Color Initiative) with documentation"
arch=('i686' 'x86_64')
url="http://www.eci.org/"
license=('Custom')
makedepends=('unzip')
source=(
  "http://www.eci.org/lib/exe/pso-coated_v3.zip"
  "http://www.eci.org/lib/exe/pso-uncoated_v3_fogra52.zip"
  "http://www.eci.org/lib/exe/pso_sc-b_paper_v3.zip"
  "http://www.eci.org/lib/exe/eci_gravure_psr_v2_m1_2020.zip"
  "http://www.eci.org/lib/exe/eci_gravure_psr_v2_2009.zip"
  "http://www.eci.org/lib/exe/ecirgbv20.zip"
  "http://www.eci.org/lib/exe/ecirgbv10.zip"
  "http://www.eci.org/lib/exe/eci_cmyk_v2.zip"
  "http://www.eci.org/lib/exe/eci-offset-profiles_supplement2020-surface-finishing_v3b.zip"
  "http://www.eci.org/lib/exe/eci_offset_profiles_metal_printing_mpc1.zip"  
  "http://www.eci.org/lib/exe/eci_offset_2009.zip"
  "http://www.eci.org/lib/exe/eci_offset_cont_2004.zip"
)

md5sums=('b080cb34d3f058e8203eb914df1350cb'
         '3eb5588990f14fc185edfbd2cc774ef2'
         'fada373f848a34b3ff7fedc9b31cf0cf'
         'dd203427f4169cd75f76ac0538907834'
         '8c534eb4e3b27678b49153f9f5747450'
         '20761e99976df9636bcf87ebe0d7e244'
         'c2d0cbf4b75b659c517ff0826cd3407b'
         'd3dab7d68916528074b3786ec3344891'
         'c64e878934708710461c61d86b7c3959'
         'a065d5f3c8f956bcf7eb201387d99c22'
         'cf98d2ed58d8951c3473defa02cea4be'
         'a2776270b2bd0d670949c423b2aeafd3')
         
         
package() {
  mkdir -p ${pkgdir}/usr/share/color/icc || return 1
  mkdir -p ${pkgdir}/usr/share/doc/eci-icc || return 1

  # PSO
  install -m644 ${srcdir}/PSOcoated_v3.icc ${pkgdir}/usr/share/color/icc || return 1
  install -m644 ${srcdir}/PSOsc-b_paper_v3_FOGRA54.icc ${pkgdir}/usr/share/color/icc || return 1
  
  install -m644 ${srcdir}/PSOcoated_v3_info.pdf ${pkgdir}/usr/share/doc/eci-icc || return 1
  install -m644 ${srcdir}/PSOsc-b_paper_v3_info.pdf ${pkgdir}/usr/share/doc/eci-icc || return 1
  
  for file in "${srcdir}/pso-uncoated_v3_FOGRA52/*.icc"
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in "${srcdir}/pso-uncoated_v3_FOGRA52/*.pdf"
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done
  
  # Metal
  install -m644 ${srcdir}/Metal-Printing_MPC1_FOGRA60.icc ${pkgdir}/usr/share/color/icc || return 1
  install -m644 ${srcdir}/Metal-Printing_MPC1_FOGRA60_info.pdf ${pkgdir}/usr/share/doc/eci-icc || return 1
    
  # Offset
  for file in "${srcdir}/ECI Offset Profiles - Supplement 2020 - Surface Finishing/"*.icc
  do
      install -m644 "$file" ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in "${srcdir}/ECI Offset Profiles - Supplement 2020 - Surface Finishing/"*.pdf
  do
      install -m644 "$file" ${pkgdir}/usr/share/doc/eci-icc || return 1
  done
  
  for file in ${srcdir}/ECI_Offset_2009/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in ${srcdir}/ECI_Offset_2009/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  for file in ${srcdir}/ECI_Offset_cont_2004/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in ${srcdir}/ECI_Offset_cont_2004/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  # Gravure
  for file in ${srcdir}/eci_Gravure_PSR_V2_M1_2020/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  for file in ${srcdir}/eci_Gravure_PSR_V2_M1_2020/ICC-Profile/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in ${srcdir}/eci_gravure_psr_v2_2009/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  for file in ${srcdir}/eci_gravure_psr_v2_2009/ICC-Profiles/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  # RGB
  for file in ${srcdir}/eciRGB_v2_profile/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  install -m644 ${srcdir}/eciRGB_v2_profile/licence.rtf \
  ${pkgdir}/usr/share/doc/eci-icc || return 1

  install -m644 ${srcdir}/eciRGBv10/ECI-RGB.V1.0.icc \
  ${pkgdir}/usr/share/color/icc || return 1

  install -m644 ${srcdir}/eciRGBv10/ECI-RGB_BitteLesen \
  ${pkgdir}/usr/share/doc/eci-icc || return 1

  install -m644 ${srcdir}/eciRGBv10/ECI-RGB_ReadMe \
  ${pkgdir}/usr/share/doc/eci-icc || return 1
  
  # CMYK
  install -m644 ${srcdir}/eciCMYK_v2.icc ${pkgdir}/usr/share/color/icc || return 1
}
