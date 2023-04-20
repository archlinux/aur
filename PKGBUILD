# Maintainer: Thiago França da Silva <tfsthiagobr98@outlook.com>

pkgname=powershell-preview-bin
_pkgver=7.4.0-preview.3
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
sha256sums=('BE418A526D5FE68F39AA1AB126C6262DBF870AE8501BA44CE8B020A2282C536B')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell-preview_${_pkgver}-1.deb_amd64.deb")

# omi fix (details here https://github.com/jborean93/omi/): not tested, feedback needed
# comment the two lines above and uncomment these lines down here
#source=(
#  "https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell-preview_${_pkgver}-1.deb_amd64.deb"
#  "https://github.com/jborean93/omi/releases/download/v2.2.1-pwsh/glibc-1.1.tar.gz"
#)
#sha256sums=('7a28a1d06c3790f9cb1b5fe7bf5df1a72bf01f8dcaa9bed1c53656739d53c64c'
#            '28434376D4A14F42805578D49C08D85611DE8D2984B868C8317BCA2E68D33434')

package() {
  bsdtar xf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  # also omi fix
  #cp -f libmi.so ${pkgdir}/opt/microsoft/powershell/$_version/libmi.so
  #cp -f libpsrpclient.so ${pkgdir}/opt/microsoft/powershell/$_version/libpsrpclient.so
  #chmod 644 ${pkgdir}/opt/microsoft/powershell/$_version/libmi.so ${pkgdir}/opt/microsoft/powershell/$_version/libpsrpclient.so

  cd "${pkgdir}"
  cp -r usr/local/share usr
  rm -rf usr/local

  chmod 755 opt/microsoft/powershell/$_version/pwsh
}
