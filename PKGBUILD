# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgver=7.0.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'openssl-1.0' 'icu')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs !strip)
install=powershell.install
sha256sums=('a28c95b376e6dd7ef0bf523b6bd329485948a53e27fd2e8b3dded6981471214c')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell_${_pkgver}-1.ubuntu.18.04_amd64.deb")

package() {
  bsdtar xf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  cp -r usr/local/share usr
  rm -rf usr/local

  chmod 755 "opt/microsoft/powershell/${_pkgver:0:1}/pwsh"
}
