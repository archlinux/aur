# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: KawaiDesu <mail@zeym.org>
pkgname=vikunja-api-bin
pkgver=0.24.4
pkgrel=1
pkgdesc="The Todo-app to organize your life"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://vikunja.io/"
license=('AGPL3')
backup=('etc/vikunja/config.yml')
options=(!strip)
install=vikunja.install
source=("vikunja-api.service"
        "vikunja.sysusers"
        "vikunja.tmpfiles"
        "config.yml")
source_x86_64=("https://dl.vikunja.io/vikunja/${pkgver}/vikunja-v${pkgver}-linux-amd64-full.zip")
source_armv7h=("https://dl.vikunja.io/vikunja/${pkgver}/vikunja-v${pkgver}-linux-arm-7-full.zip")
source_aarch64=("https://dl.vikunja.io/vikunja/${pkgver}/vikunja-v${pkgver}-linux-arm64-full.zip")

sha256sums=('ee744fe59a75a6396a44f74f618feb099d077e9384460f673007fe6da3e5222f'
            '0a666743be3deaa16a436681d18003b11a1660b5fe7868fa25af2de11c7624f7'
            '77ae5d2215017969f561351a543f6777a0f55de20abb80094509188ba89e1f3e'
            'bd8537a6a74fa4c8d4ea789dd54a8684d9d696835762d1e3e36f06c9c9dfab7e')
sha256sums_x86_64=('dc39be6a24dc732bfce80f7e05b5262310b2bb23cde5c155a1867f92e22afb78')
sha256sums_armv7h=('d85a4d6cd68f51343f31b000d6b6b7dc791a4c8f0ddaaba7c774865478489c24')
sha256sums_aarch64=('22481d10ca03ed8c6a0089dee8d5b0302f905b24d6ea712dd46432f43fb391bb')

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

  install -Dm640 "${srcdir}/vikunja-api.service" "${pkgdir}/usr/lib/systemd/system/vikunja-api.service"
  install -Dm640 "${srcdir}/config.yml" "${pkgdir}/etc/vikunja/config.yml"
  install -Dm644 "${srcdir}/vikunja.sysusers" "${pkgdir}/usr/lib/sysusers.d/vikunja.conf"
  install -Dm644 "${srcdir}/vikunja.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/vikunja.conf"
}
