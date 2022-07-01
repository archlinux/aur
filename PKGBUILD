# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Hannes Eichblatt <lists@hanneseichblatt.de>

pkgname='wifijammer-git'
_basename="${pkgname%-git}"
pkgver=r92.5f69529
pkgrel=1
pkgdesc='Continuously jam all wifi clients and access points within range.'
arch=('x86_64')
url="https://github.com/DanMcInerney/${_basename}"
license=('BSD')
makedepends=('git')
provides=("${_basename}")
conflicts=("${_basename}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'python2'
    'python2-scapy'
  )
  cd "${_basename}"
  install --verbose -Dm 744 "${_basename}" -t "${pkgdir}/usr/bin"
  install --verbose -Dm 644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  grep -A 100000 -e "^License$" 'README.md' > 'LICENSE.md'
  install --verbose -Dm 644 'LICENSE.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
