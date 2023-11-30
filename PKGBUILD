# Maintainer: lafleur <lafleur at boum dot org>
pkgname=conduit-bin
_pkgname=${pkgname/-bin/}
pkgver=0.6.0
pkgrel=1
pkgdesc="stable, pre-compiled versions of the Conduit server (Matrix protocol)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://conduit.rs"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/${_pkgname}.toml")

source=(
  "${_pkgname}.toml"
  "${_pkgname}.service"
  'tmpfiles.conf'
  'sysusers.conf'
)
source_x86_64=("${_pkgname}::https://gitlab.com/famedly/conduit/-/jobs/artifacts/master/raw/build-output/linux_amd64/${_pkgname}?job=docker:master")
source_aarch64=("${_pkgname}::https://gitlab.com/famedly/conduit/-/jobs/artifacts/master/raw/build-output/linux_arm64/${_pkgname}?job=docker:master")
source_armv7h=("${_pkgname}::https://gitlab.com/famedly/conduit/-/jobs/artifacts/master/raw/build-output/linux_arm_v7/${_pkgname}?job=docker:master")

package() {
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.toml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.toml"
  install -vDm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}

sha256sums=('31214654367ca03c0e2b6cd615b6f8febfae249a6771f956b2a0996a11b6b98f'
            '1c5f53cc49bae88b80281ab6edcf08e18430e5db668eaa186b8be4928f850594'
            '4316952810a2295b81d7faf3e28c371dd63629671c4b7e3c39bfbae5ab9e2db6'
            '0f454a2a5af857fe978e2276798fb357b4578c6ee705664a794426c8b7576a4c')
sha256sums_x86_64=('eb085e2a43e9225da1fafe01956b361a48b48a1dce9370c3e09bbc120ff6998d')
sha256sums_aarch64=('ef089841b2ff23285fa458459a3add2a608c0ec0702434b1a8973d2cac1b978f')
sha256sums_armv7h=('595534a8eb19496f7ac39130e62a29645fc04b001faad72032144ab97467d394')
