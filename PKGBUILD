# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mpm
_pkgauthor=kdeldycke
_pkgname=meta-package-manager
pkgname=${_pkgname}-bin
pkgver=6.3.0
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
            'f32dca6e1fc50e12a7651ea9a5e77dcdfd18a79eb8173c92ae841e8ae7681972'
            '7bdacda1e9dd48f2741a67438b34fdeddf70fc1b3a8f55cb9c0b31b243c43361')
sha256sums_x86_64=('5236f33e9172e5ab3830a73826191aac9a7a4a946888210d832f4e414e08ed1b')
sha256sums_aarch64=('5236f33e9172e5ab3830a73826191aac9a7a4a946888210d832f4e414e08ed1b')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
