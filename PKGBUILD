# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=arm-compiler-for-embedded
pkgver=6.24
pkgrel=1
pkgdesc='Arm Compiler for Embedded (armclang) - C/C++ compiler for Arm Cortex-M and Cortex-R'
arch=('x86_64')
license=('custom:Commercial')
url='https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Embedded'

depends=('glibc')
options=('!strip' '!debug')

source=("https://artifacts.keil.arm.com/arm-compiler/${pkgver}/19/standalone-linux-x86_64-rel.tar.gz")
sha256sums=('55cdfa20b2588ea52222d9f836258b0e01c220251ddf46d39605939ce07e9117')

install="${pkgname}.install"

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/opt/arm-compiler-for-embedded"
  install -d "${pkgdir}/usr/bin"

  cp -a bin include lib license_terms sw "${pkgdir}/opt/arm-compiler-for-embedded/"

  local _tools=('armclang' 'armasm' 'armlink' 'armar' 'armlm' 'fromelf')
  for _tool in "${_tools[@]}"; do
    ln -s "/opt/arm-compiler-for-embedded/bin/${_tool}" "${pkgdir}/usr/bin/${_tool}"
  done

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/arm-compiler-for-embedded/license_terms" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license_terms"
}

# vim: set sw=2 ts=2 et:
