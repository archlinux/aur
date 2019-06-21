# Maintainer: xythrez <yuydevel at protonmail com>
# Contributer: ajs124 < aur AT ajs124 DOT de >
# Contributer: meyithi <mail at meyithi dot com>
# Contributer: sl1pkn07 <sl1pkn07 at gmail dot com>
# Contributer: yannsen <ynnsen at gmail dot com>

pkgname=unigine-heaven
_pkgname=Unigine_Heaven
pkgver=4.0
pkgrel=2
pkgdesc="Unigine Benchmark"
arch=('i686' 'x86_64')
url="http://www.unigine.com"
license=('custom:UNIGINE Engine')
depends=('libgl' 'gcc-libs' 'libxrandr' 'libxinerama' 'fontconfig')
optdepends=('openal: sound support')
source=("https://assets.unigine.com/d/"${_pkgname}"-"${pkgver}".run")
sha512sums=('f075968d9812c7bd6a19cd27c48612203ce81f48b14ba56239419957fd3342adb31267ed8c261b7b1c68e2589a07d4cee84b199fb12d8d69e2d6a34fbdcf76c1')

[ "${CARCH}" = "i686" ] && _arch=x86
[ "${CARCH}" = "x86_64" ] && _arch=x64

build() {
  sh "${_pkgname}"-"${pkgver}".run -- --target "${pkgname}" --noexec
}
package() {
  cd "${srcdir}"/"${_pkgname}-${pkgver}"
  install -d "${pkgdir}"/opt/"${pkgname}"/bin/
  install -m775 bin/*_"${_arch}"* "${pkgdir}"/opt/"${pkgname}"/bin/
  cp -R data "${pkgdir}"/opt/"${pkgname}"/
  install -Dm755 heaven "${pkgdir}"/usr/bin/"${pkgname}"
  sed -e "s|cd ./bin|cd /opt/"${pkgname}"/bin|" -e "s|./launcher_x86|./launcher_"${_arch}"|g" -i "${pkgdir}"/usr/bin/"${pkgname}"
  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  echo "Go to http://www.unigine.com" > "${pkgdir}"/usr/share/licenses/"${pkgname}"/license
  install -Dm644 documentation/User_Manual.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"/User_Manual.pdf
}
