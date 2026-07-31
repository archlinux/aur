# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dankcalendar
_binname=dcal
_iconname=com.danklinux.dankcalendar
_desktopid=com.danklinux.dankcalendar

pkgname=dankcalendar-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Local, Google, Microsoft, and CalDAV calendars for the dank desktop (prebuilt binary)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
_urlrel="${url}/releases/download/v${pkgver}"
license=('MIT')
depends=('quickshell' 'qt6-declarative')
optdepends=('dms-shell: dynamic theming via DankMaterialShell colors')
provides=("${_binname}" "${_repo}")
conflicts=("${_binname}" "${_repo}" 'dankcalendar-git')

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "${_desktopid}-${pkgver}.desktop::${_urlraw}/assets/${_desktopid}.desktop"
  "${_binname}-${pkgver}.service::${_urlraw}/assets/systemd/${_binname}.service"
  "${_iconname}-${pkgver}.svg::${_urlrel}/${_iconname}.svg"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('a5b49222ed7b2e61fc82bc0d834be0729d9c4d4ed55798ff563c6ad0474178ad'
            'e8156dd38b7d6deeed5900195d6268c85b795b5326c0d17bab74addf77e0e331'
            '689ca0c6c7a4d3865a247daa9b617f1d02523821a2e9fe1cec89e46749b108c5'
            '24586ef0584046c0217f52a20d397f5ea4952f3d8ef0d110f9479e2284606aeb'
            'cd26b519de5c0e990139a12616bf14aade644aa3aa39e61068403f52a7178933'
            'baffc363766ee96b7a1351eb88173aede164e8437ecba4f5b4235544b37118dc')
sha256sums_x86_64=('0d7db532438842942d3e3825d07f8cf3634786d3a16aaba2b1ad52fbcd4e4d95')
sha256sums_aarch64=('64dc59e938e7599d9b33f4974b8022eced1e8fb9642ef119148db1c596c13c0a')

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -Dm644 "${_iconname}-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_iconname}.svg"

  install -Dm644 "${_desktopid}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/${_desktopid}.desktop"

  install -Dm644 "${_binname}-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_binname}.service"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
