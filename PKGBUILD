# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nvidia_oc"
pkgname="${_pkgname}-bin"
pkgver=0.1.24
pkgrel=1
pkgdesc="A simple CLI tool to overclock Nvidia GPUs using the NVML library on both X11 and Wayland"
arch=(
  'x86_64'
)
url="https://github.com/Dreaming-Codes/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
backup=(
  "etc/conf.d/${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
  "${_pkgname}.conf"
  "${_pkgname}.service"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}"
)
sha256sums=('6d9997a21a592c51dfe6ab5b1aac01057bb2ed0360b30c9c48ebed0d693fb809'
            '8cbfb03e85b70d711832f97ef78f078c6bc7a5353b198243fad29970b2b53a32'
            '94652b5635b6ef283830f5640d6dca3686d92068def6f46b78e4652939125fb1'
            '4edc3922ed3003b7699b07b0d982846b0da2efd160992954d1b8f4112729cbdd')
sha256sums_x86_64=('7692c8b08531ea642926de5fdb058bab6f423616379e0216a15046f11870d16f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_pkgname}.conf"    "${pkgdir}/etc/conf.d/${_pkgname}"
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
