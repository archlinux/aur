# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=mifi
_pkgname=ezshare
pkgname=${_pkgname}-bin
pkgver=2.0.1
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
            'b5efed39009124b94c3cf34414632d20cedbca1e07e7aa559652b1b9bb083195')
sha256sums_x86_64=('d703ccc7eab9d87b80640c067dafe50b22d28e3745c31a8900d35455a79567d3')


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
