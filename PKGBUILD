# Maintainer: Curve <curve.platin at gmail.com>
pkgname=il2cpp-dumper-bin
url='https://github.com/Perfare/Il2CppDumper'

license=('MIT')
pkgdesc='A tool to reverse engineer il2cpp games'

pkgver=6.7.40
pkgrel=1

provides=('il2cpp-dumper')
conflicts=('il2cpp-dumper')

arch=('x86_64')
makedepends=('jq' 'curl')
depends=('dotnet-host' 'dotnet-runtime-7.0')

source=(
   il2cpp-dumper_$pkgver.zip::$(curl "https://api.github.com/repos/Perfare/Il2CppDumper/releases/latest" -s | jq -r '.assets[]|select(.browser_download_url | contains("net7-v")).browser_download_url')
  'il2cpp-dumper'
  'https://raw.githubusercontent.com/Perfare/Il2CppDumper/master/LICENSE'
)

sha256sums=(
  'SKIP'
  'db3c1fb46b79cd5c786d0c4934735f1e93f3da9c13c8a16d7d9b78203f731e79'
  '373bd2ed813eaa8245d1290138985c6fb025d588db254602720697455ae36c6c'
)

pkgver()
{
  tag_name=$(curl "https://api.github.com/repos/Perfare/Il2CppDumper/releases/latest" -s | jq -r '.tag_name')
  echo "${tag_name:1}"
}

package() 
{
  # Install startup script
  install -m 755 -D "il2cpp-dumper" "${pkgdir}/usr/bin/il2cpp-dumper"

  # Install il2cpp files
  install -d "${pkgdir}/usr/share/il2cpp-dumper"
  install -m 644 ${srcdir}/{*.json,*.dll,*.py} "${pkgdir}/usr/share/il2cpp-dumper/"
  
  # Install license
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
