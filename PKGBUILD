# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
pkgname=vikunja-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="The Todo-app to organize your life"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://vikunja.io/"
license=('AGPL3')
options=(!strip)
conflicts=('vikunja')
source=("vikunja.service"
        "vikunja.sysusers"
        "vikunja.tmpfiles")
source_x86_64=("https://dl.vikunja.io/vikunja/v${pkgver}/vikunja-v${pkgver}-linux-amd64-full.zip")
source_armv7h=("https://dl.vikunja.io/vikunja/v${pkgver}/vikunja-v${pkgver}-linux-arm-7-full.zip")
source_aarch64=("https://dl.vikunja.io/vikunja/v${pkgver}/vikunja-v${pkgver}-linux-arm64-full.zip")

sha256sums=('c710d101f36b4838c0b20b09dbc53fdc351e252e65cee0e8a679d99058df0c46'
            'a6f42e19d1742c9c836edf641cbe095c358065dea210b4303357cfcfbbda5634'
            '77ae5d2215017969f561351a543f6777a0f55de20abb80094509188ba89e1f3e')
sha256sums_x86_64=('8843de18f5f297bac83db010a54064a45033f82cffdf53421f6ce39f12a8ad98')
sha256sums_armv7h=('c98905c277baca10092c15ef65c1f0c02c0da4cdd63a2ac1ef04f2a3e7115151')
sha256sums_aarch64=('299b90a2b9c5a54a2901f0c585f91cdc48042d59d2355ef5d058d6f27c5af45a')

package(){
  case "${CARCH}" in
    x86_64)
      install -Dm755 "${srcdir}/vikunja-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/vikunja"
      ;;
    armv7h)
      install -Dm755 "${srcdir}/vikunja-v${pkgver}-linux-arm-7" "${pkgdir}/usr/bin/vikunja"
      ;;
    aarch64)
      install -Dm755 "${srcdir}/vikunja-v${pkgver}-linux-arm64" "${pkgdir}/usr/bin/vikunja"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}"
      return 1
      ;;
  esac

  install -Dm640 "${srcdir}/vikunja.service" "${pkgdir}/usr/lib/systemd/system/vikunja.service"
  install -Dm640 "${srcdir}/config.yml.sample" "${pkgdir}/etc/vikunja/config.yml.sample"
  install -Dm644 "${srcdir}/vikunja.sysusers" "${pkgdir}/usr/lib/sysusers.d/vikunja.conf"
  install -Dm644 "${srcdir}/vikunja.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/vikunja.conf"
}
