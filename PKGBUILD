# Maintainer: neilg <neil.r.green+aur@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=yourkit
_version=2025.3
_build=134
pkgver=${_version}.b${_build}
pkgrel=1
pkgdesc="Java CPU and memory profiler."
arch=(i686 x86_64 aarch64)
url="http://www.yourkit.com"
license=(custom)
depends=(desktop-file-utils bash)
optdepends=('intellij-idea-community-edition: A Java IDE that integrates with Yourkit'
            'eclipse: A Java IDE that integrates with Yourkit'
            'netbeans: A Java IDE that integrates with Yourkit')
options=(!strip)
_url() {
  printf '%s' "https://download.yourkit.com/yjp/${_version}/YourKit-JavaProfiler-${_version}-b${_build}-$1.zip"
}
source_x86_64=("$(_url x64)")
source_i686=("${source_x86_64[@]}") # Same as source_x86_64
source_aarch64=("$(_url arm64)")
source=(
  yourkit-yjp.desktop
  yourkit.sh
)
sha256sums_x86_64=('11ef516385a9c4372112c850989d60228afbf4588ddbe654bc7453da9090486e')
sha256sums_i686=("${sha256sums_x86_64[@]}") # Same as sha256sums_x86_64
sha256sums_aarch64=('ae93d007a18066ae5a9b62f8656fe2d9223e87bae7fe0da2a936952c1b95bd62')
sha256sums=('b071670d8264f4ec8c61d83f3717e83c7c87873c678a75d60670a002e185373d'
            '6fc9612a76e2b50bb84130b0c40fcaccd04fe513e23ced398e707087459cc50e')

package() {
  cd "$srcdir"
  install -d "${pkgdir}/opt/${pkgname}"

  mv YourKit-JavaProfiler-"${_version}"/* "${pkgdir}/opt/${pkgname}"

  install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /opt/${pkgname}/probes  "${pkgdir}/usr/share/doc/${pkgname}/probes"
  ln -s /opt/${pkgname}/samples "${pkgdir}/usr/share/doc/${pkgname}/samples"

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/license.html        "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s /opt/${pkgname}/license-redist.txt  "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 yourkit-yjp.desktop "${pkgdir}"/usr/share/applications/yourkit-yourkit.desktop
}

# vim:set ts=2 sw=2 et:
