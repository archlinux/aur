# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: notjustbill
# Contributor: untitled
# Contributor: mh00h
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>

set -u
pkgname='iscan-plugin-gt-x820'
pkgver='2.2.0_1'; _bundlever='1.0.1'
pkgrel='1'
pkgdesc='iscan plugin for Epson Colorio GT-X820 Perfection V600 Photo scanners'
arch=('i686' 'x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('custom')
depends=('iscan>=2.21')
install='gt-x820.install'
declare -gA _archf=([i686]='x86' [x86_64]='x64')
source=('http://support.epson.net/linux/src/scanner/iscan/iscan-data_1.36.0-1.dsc') # dummy file to fill source array
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/gt-x820/rpm/x64/iscan-gt-x820-bundle-${_bundlever}.x64.rpm.tar.gz")
source_i686=("https://download2.ebz.epson.net/iscan/plugin/gt-x820/rpm/x86/iscan-gt-x820-bundle-${_bundlever}.x86.rpm.tar.gz")
sha256sums=('07a7cd6ec4b6618222cef71d2d76268e785b816b12038133d787e79ee98ebba0')
sha256sums_i686=('87c009a6ff4fa33c46a0990d92152dc63f3261958eb168b4b7a69828554512ce')
sha256sums_x86_64=('4f053966fb14f1b4e2e8b593891c02ec10c20cd22f941852609658d90082f4a9')

prepare() {
  set -u
  cd "iscan-gt-x820-bundle-${_bundlever}.${_archf[${CARCH}]}.rpm/plugins"
  declare -A _arch=([i686]='i386' [x86_64]='x86_64')
  bsdtar -xf "iscan-plugin-gt-x820-${pkgver//_/-}.${_arch[${CARCH}]}.rpm"
  if [ -d "usr/lib64" ]; then
    mv 'usr/lib64' 'usr/lib'
  fi
  set +u
}

package() {
  set -u
  cd "iscan-gt-x820-bundle-${_bundlever}.${_archf[${CARCH}]}.rpm/plugins"
  mv 'usr' "${pkgdir}"
  install -Dpm644 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver%%_*}"/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -r "${pkgdir}/usr/share/doc"
  set +u
}
set +u
