# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dankcalendar
_binname=dcal
_iconname=com.danklinux.dankcalendar
_desktopid=com.danklinux.dankcalendar

pkgname=dankcalendar-bin
pkgver=0.2.7
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
            'caa343ab02f0cf15c4f3b4d3b99a89000caac876d81aa3845f331ff5a44f2efd'
            '689ca0c6c7a4d3865a247daa9b617f1d02523821a2e9fe1cec89e46749b108c5'
            '24586ef0584046c0217f52a20d397f5ea4952f3d8ef0d110f9479e2284606aeb'
            'cd26b519de5c0e990139a12616bf14aade644aa3aa39e61068403f52a7178933'
            'f228899c25b053137d030bd53d32926ae4c2a2e99811b95580cfe71530f3a4da')
sha256sums_x86_64=('3b33f3333b0a7dacc8b19941143244eda76b7d742761093b4baf8e0cc074670c')
sha256sums_aarch64=('aba46e77f1b97ccbc89133ad34566bbb86cd23c739f5737bd30e800fe4e1f8a9')

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
