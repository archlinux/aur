# Maintainer: Thiago França da Silva <tfsthiagobr98@outlook.com>

pkgname=powershell-preview-bin
_pkgver=7.2.0-preview.2
_version=7-preview
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary preview package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'openssl' 'icu')
provides=('powershell')
options=(staticlibs !strip)
install=powershell-preview.install
sha256sums=('35CB3809F6575C224E8C299A928BAA7B1F382044D1E75835B05C499CEEDC052C')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell-preview_${_pkgver}-1.debian.11_amd64.deb")

package() {
  bsdtar xf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  cp -r usr/local/share usr
  rm -rf usr/local

  chmod 755 opt/microsoft/powershell/$_version/pwsh
}
