# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aescrypt"
pkgname="${_pkgname}-bin"
pkgver=4.0.7
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard"
arch=('x86_64')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_cli"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "CHANGELOG-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "LICENSE-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname}_cli-${pkgver}-Linux-x86_64.tar.gz")
b2sums=('5c2bf1efad8b8ab5b20ebec0eb0169a26bf18f87d2904db17dba3b72b8c7e1838cf29965bec8cc63ea4c77faeb0a1f65b27661703a43af4b8799bf7443359a81'
        'd257274532efd1256c501a865d002a6c9cdcc3062983f7473e70b178c6536244c47ff7004d536609f0627ec11af496279a9e7cebabcc6130428ad3f270622598'
        '6cd45abeece31c6a176fed9972b7d25fc1920c4a6d71f27710409ecf52250180771949317a04f9642dc7efb7faa201ecd2298dcd49b0a2e9ff2fe1aa811e4060')
b2sums_x86_64=('0c014b59aaf1db5b35bb30d2a1683ce60a70c779d3e15c7800db2ecdf10ecb111a038bc7fc9f86f497e36845dd7a8714117c015c8c52a7bb7fba7bbd5a86d5c3')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -Dm644 "LICENSE-${pkgver}.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  
  cd "${_pkgname}_cli-${pkgver}-Linux-${CARCH}"
  find "bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}
