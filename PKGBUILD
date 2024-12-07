# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aescrypt"
pkgname="${_pkgname}-bin"
pkgver=4.1.0
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
        '8e5265223d1b4b3a1f2aa76d012bdaea3c3eafa5a44da40cf2711ec3a5dfe1f3e963bdfc087ef848127e0d3ad05b9f6acbaccdc9a483aa9d34358efdd0e33e4f'
        '6cd45abeece31c6a176fed9972b7d25fc1920c4a6d71f27710409ecf52250180771949317a04f9642dc7efb7faa201ecd2298dcd49b0a2e9ff2fe1aa811e4060')
b2sums_x86_64=('45ef9758f0f96269b840734e7204159668f9fc2802bb3445c6e8f8be3501e9aa783fd38ec8417eb442185806794def84ffeb08c69de6610fde30d02f29cfc8bc')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "LICENSE-${pkgver}.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  
  cd "${_pkgname}_cli-${pkgver}-Linux-${CARCH}"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
