# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Alif Rachmawadi <subosito at gmail dot com>

pkgname=flutter-beta
_pkgname=flutter
pkgver=0.8.2
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${_pkgname}.io"
license=("custom" "BSD" "CCPL")
depends=("glu" "java-environment" "lib32-libglvnd")
optdepends=("android-sdk"
            "android-studio"
            "bash"
            "dart"
            "git"
            "intellij-idea-community-edition"
            "intellij-idea-ultimate-edition"
            "perl"
            "python"
            "sh")
makedepends=("git" "python")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("opt/${_pkgname}/packages/${_pkgname}_test/pubspec.yaml" "opt/${_pkgname}/packages/${_pkgname}/pubspec.yaml")
options=("!emptydirs")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra/releases/beta/linux/${_pkgname}_linux_v${pkgver}-beta.tar.xz"
        "${_pkgname}.sh"
        "${_pkgname}.csh")
sha256sums=("c201ec9b3242fa6fb89296c55fbd6a252f26faacdff5ca6768175858ed9a97a5"
            "1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a"
            "7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f")

build() {
  cd "${srcdir}/${_pkgname}"
  "bin/${_pkgname}" doctor
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${srcdir}/${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
  install -d "${pkgdir}/opt/${_pkgname}/"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
  chmod a+rw "${pkgdir}/opt/${_pkgname}/bin/cache/lockfile" "${pkgdir}/opt/${_pkgname}/version"
}
