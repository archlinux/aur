# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_build=3384
pkgname=youtrack-workflow-editor
pkgver=6.0
pkgrel=1
pkgdesc='A MPS-based application to create and edit workflows for YouTrack.'
arch=('any')
url='http://www.jetbrains.com/youtrack/'
backup=("usr/share/${pkgname}/bin/idea.properties" "usr/share/${pkgname}/bin/youtrack-workflow.vmoptions")
license=('Commercial')
depends=('java-environment<7')
source=("https://download.jetbrains.com/charisma/${pkgname}-${_build}.tar.gz" \
        "${pkgname}.sh" \
        "${pkgname}.desktop")
sha256sums=('f25009b9108e50f2b40df3b0dda6fea39825c8885fad67886d6000765f646e9c'
            'be320a1d8c56b6fc3feab51a06fbe3acbb7039df842bcda2f3145e9e83f06536'
            '2aef96faa5351a28ee40db1de3e92a9353fde14a2f2c8490e740d89c3339a8f8')

package() {
  cd "${srcdir}"

  install -d -m755 "${pkgdir}"/usr/{bin,share,share/licenses}
  cp -a "youtrack-workflow" "${pkgdir}/usr/share/${pkgname}"

  chown -R root:root "${pkgdir}/usr/share"

  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 0755 {} ';'
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 0644 {} ';'

  chmod +x "${pkgdir}/usr/share/${pkgname}/youtrack-workflow.sh"

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -a "${srcdir}/youtrack-workflow/license" "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
