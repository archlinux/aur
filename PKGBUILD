# Maintainer: Kppqju77 <ju.adde-gmail-com>

pkgname=flutter-beta
pkgver=3.7.0_1.2.pre
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-beta}.io"
license=("custom" "BSD" "CCPL")
depends=("git" "glu" "java-environment" "libglvnd" "unzip")
optdepends=("android-sdk" "android-studio" "dart" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "perl" "python" "android-sdk-cmdline-tools-latest: for android checks" "cmake: for linux desktop build" "ninja: for linux desktop build" "clang: for linux desktop build" "gtk3: for linux desktop build")
makedepends=("python")
provides=("${pkgname%-beta}=${pkgver}")
conflicts=("${pkgname%-beta}")
backup=("opt/${pkgname%-beta}/packages/${pkgname%-beta}_test/pubspec.yaml" "opt/${pkgname%-beta}/packages/${pkgname%-beta}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname%-beta}.install"
source=(
  "${pkgname%-beta}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/beta/linux/${pkgname%-beta}_linux_${pkgver/_/-}-beta.tar.xz"
  "${pkgname%-beta}.sh"
  "${pkgname%-beta}.csh"
)
sha256sums=('f72135714f722d591f03af37d6db34fabaf2610e528b08904acbd55081b1d3a9'
            '1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

build() {
  cd "${srcdir}/${pkgname%-beta}"
  "${srcdir}/${pkgname%-beta}/bin/${pkgname%-beta}" doctor
}

package() {
  rm -rf "${srcdir}/${pkgname%-beta}/bin/cache" "${srcdir}/${pkgname%-beta}/.pub-cache"
  install -Dm644 "${srcdir}/${pkgname%-beta}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname%-beta}.sh" "${pkgdir}/etc/profile.d/${pkgname%-beta}.sh"
  install -Dm755 "${srcdir}/${pkgname%-beta}.csh" "${pkgdir}/etc/profile.d/${pkgname%-beta}.csh"
  install -dm755 "${pkgdir}/opt/${pkgname%-beta}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${pkgname%-beta}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${pkgname%-beta}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${pkgname%-beta}" -type f -exec chmod a+r {} +
  chmod a+rw "${pkgdir}/opt/${pkgname%-beta}/version"
  ln -s "/opt/${pkgname%-beta}/bin/${pkgname%-beta}" "${pkgdir}/usr/bin/${pkgname%-beta}"
}
