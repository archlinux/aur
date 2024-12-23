# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: KawaiDesu <mail@zeym.org>
pkgname=vikunja-api-bin
pkgver=0.24.6
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
sha256sums_x86_64=('0007e0fb9e88021b390d898ad88a44d8981d52fee57ec19e0586703afb28f01a')
sha256sums_armv7h=('4f5a04cc33eb05d6c68f91e5cf1c801bb1678b4688a743b41f59bc87a22b95e5')
sha256sums_aarch64=('0595a36e5f1da1fb9842d152e075c08b6a85fea8f958ff4a0983df7f36377ecf')

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
