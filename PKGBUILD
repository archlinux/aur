# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
pkgname=vikunja-bin
pkgver=2.4.0
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
sha256sums_x86_64=('eefc0e31587e0c9d7b18f38d4d50dd1fa03fd5fc6879eb9894ce9909620072ea')
sha256sums_armv7h=('4c62a1480147b9f2d942b4d6b08ee6daceb6326fbd99b0e652ae43086d52ca3f')
sha256sums_aarch64=('299c6f85890152457fa8b25cc064445e05c8b5c1a678d0deb8e281579532f38a')

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
