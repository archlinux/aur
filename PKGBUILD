# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Stefan Seering

pkgname='hashcat'
pkgver=0.50
pkgrel=1
pkgdesc='A multithreaded cross platform hash cracker.'
arch=('i686' 'x86_64')
_url='https://hashcat.net'
url="${_url}/${pkgname}/"
license=('custom:proprietary')
install="${pkgname}.install"
source=("${_url}/files/${pkgname}-${pkgver}.7z"
        "${install}")
md5sums=('53a9b867b34c30b51b2f1c70477bdbd8'
         'a34b6cb45bae5dc353d123072fcce7ec')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [[ "$CARCH" == 'x86_64' ]]; then
    mv hashcat-cli64.bin hashcat
  else
    mv hashcat-cli32.bin hashcat
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  rm *.{exe,bin,app}

  install -d "${pkgdir}"/{usr/share/doc,etc}/"${pkgname}"
  install -Dm755 hashcat "${pkgdir}/usr/bin/${pkgname}"

  cp -a --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}"/{rules,salts,tables} "${pkgdir}"/etc/"${pkgname}"/
  cp -a --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}"/examples "${pkgdir}"/usr/share/doc/"${pkgname}"/
}

# vim:set ts=2 sw=2 et:
