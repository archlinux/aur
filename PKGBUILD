# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=qilin
pkgname=${_base}-bin
pkgver=0.4.0.alpha
pkgrel=2
pkgdesc="Fully hackable text editor developed for exact sciences with built-in KaTeX and AsciiMath support"
arch=('x86_64')
url="https://github.com/${_base}-editor/${_base}-app"
license=(MIT)
provides=("${_base}")
depends=(gconf gtk3 libxss nss)
makedepends=(gendesk)
source=(${url}/releases/download/v${pkgver/.alpha/-alpha}/${_base}-linux.zip
  ${_base}.jpg)
sha512sums=('6487a63a2b2a8e1d94d1eb9847ab1112e80019aee999a0cdf3461ebdd719e6e7f3b5b1f0016adfd8f7158c50d4675b15e6c9a388023f156fff4a54f281d96c7f'
  'SKIP')

package() {
  rm linux64/.DS_Store
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -vR linux64 "${pkgdir}/opt/Qilin"
  ln -s /opt/Qilin/me.laniewski.qilin "${pkgdir}/usr/bin/qilin"
  gendesk -f -n \
    --pkgname "${_base}" \
    --pkgdesc "${pkgdesc}" \
    --name "Qilin Editor" \
    --comment "${pkgdesc}" \
    --exec "${pkgname}" \
    --categories 'Utility;Application;' \
    --icon "${pkgname}"
  install -Dm644 "${_base}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 qilin.jpg -t "${pkgdir}/usr/share/pixmaps/"
}
