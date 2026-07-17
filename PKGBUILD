# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mpm
_pkgauthor=kdeldycke
_pkgname=meta-package-manager
pkgname=${_pkgname}-bin
pkgver=7.3.0
pkgrel=1
pkgdesc='A wrapper around all package managers'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/license"
        "README-${pkgver}.md::${_urlraw}/readme.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md")
source_x86_64=("${_pkgexec}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.bin")
source_aarch64=("${_pkgexec}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.bin")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '47e680d4329cf1942e4a9a59d1431b662d2f003765dfbc089ca20bd533c27029'
            'e64fe71a63a451370991fb5864c1c95ee69ad63185e1454dfaeb072cca6ed1d6')
sha256sums_x86_64=('410eec40b0e448d1808192e7b6cd2ce8cb38baf7a16321df7c90a44b7b294249')
sha256sums_aarch64=('410eec40b0e448d1808192e7b6cd2ce8cb38baf7a16321df7c90a44b7b294249')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
