# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mpm
_pkgauthor=kdeldycke
_pkgname=meta-package-manager
pkgname=${_pkgname}-bin
pkgver=8.1.2
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
            '415ea27b965c051244952e48ee8fef451fe2c9daea3eaf14177e996fdc851ed5'
            '0d27c245f57bd6fb788611db54f6bab6235dab47c027c2f3789dbfaf23ae15d7')
sha256sums_x86_64=('fe31039df4101b9a0fb8de9dda92c874f542a2caa4929c0afd1eb8c6dca2a3b8')
sha256sums_aarch64=('fe31039df4101b9a0fb8de9dda92c874f542a2caa4929c0afd1eb8c6dca2a3b8')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
