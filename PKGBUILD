# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=mifi
_pkgname=ezshare
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Easily share files, folders and clipboard over LAN - Like Google Drive but without internet'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('unzip')

options=(!strip)

noextract=("${pkgname}-${pkgver}.zip")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip")
sha256sums=('45f0b58ab7c3ea2b8f2be6e31656d4327a5e35d5116ff8e92457c7d672c92321'
            '20ce34cc376a72815bfd2e7e82042e52b791aefdf66886a7ce9b7dbfc445ff7d')
sha256sums_x86_64=('fd3028c5af914cabd56f269b737a65e67bba79f6d507aa004d054affd997f915')


package() {
  cd "${srcdir}/" || exit

  mkdir -p "${pkgdir}/usr/lib"
  unzip "${pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/lib/${_pkgname}-linux-x64" "${pkgdir}/usr/lib/${_pkgname}"
  chmod 755 -R "${pkgdir}/usr/lib/${_pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -rsf "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
