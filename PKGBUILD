# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="yeetfile"
_pkgname=(
  "${_pkgbase}-common"
  "${_pkgbase}"
  "${_pkgbase}-server"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=0.2.0
pkgrel=1
pkgdesc="A self-hosted service for encrypted file sharing and storage"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://yeetfile.com"
_url="https://github.com/benbusby/${_pkgbase}"
license=(
  'AGPL-3.0-only'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgbase}_linux_arm64_${pkgver}.tar.gz"
  "${_url}/releases/download/v${pkgver}/${_pkgbase}-server_linux_arm64_${pkgver}.tar.gz"
)
source_armv7h=(
  "${_url}/releases/download/v${pkgver}/${_pkgbase}_linux_arm32_${pkgver}.tar.gz"
  "${_url}/releases/download/v${pkgver}/${_pkgbase}-server_linux_arm32_${pkgver}.tar.gz"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgbase}_linux_386_${pkgver}.tar.gz"
  "${_url}/releases/download/v${pkgver}/${_pkgbase}-server_linux_386_${pkgver}.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgbase}_linux_amd64_${pkgver}.tar.gz"
  "${_url}/releases/download/v${pkgver}/${_pkgbase}-server_linux_amd64_${pkgver}.tar.gz"
)
sha256sums=('5f7e69f60d94449a4fa9c13cdc0c7be3d6aa0b4be6d60faae851723ee38436ad'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_aarch64=('09ad239af2c1574ec7c54a33d8ab503ddc9779e562ab5b8806d1d7dd411be66f'
                    '234a61f2d0d9791afd1de98c36adabe3e41f68802582233fd2f20358ba53fd62')
sha256sums_armv7h=('017c57785a4e4870a68055f2b22c47f2aec128fdfb6d7076fc3ae88c943953b4'
                   'c988e06b4a6858bcb56d1073f23918e6c6da1231146718e263bce4c63d0378a3')
sha256sums_i686=('7887b0fa9cf957a336c67cfc9ec956ca935238bdb8b3018f31974a85e584721f'
                 '7e2e0922769ffabcca50266033ec9304371c6c5438543cd0f6e95b48a7c10cba')
sha256sums_x86_64=('693f80a3f34749ee700af89174662bbd2d6675c5df2e289df9f4145aecb2c2e7'
                   '9fc2c5b36c5d01e819f15e55e79614b461e6774c013004a567a3f1c8b8ff6020')

package_yeetfile-common-bin() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

package_yeetfile-bin() {
  pkgdesc+=" (CLI)"
  depends=(
    "${_pkgbase}-common>=${pkgver}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_yeetfile-server-bin() {
  pkgdesc+=" (server)"
  depends=(
    "${_pkgbase}-common>=${pkgver}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
