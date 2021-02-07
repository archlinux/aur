# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Ishaq Shaik  <sonuishaq67@gmail.com>
pkgname=flutter-dev
pkgver=1.26.0_17.2.pre
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-dev}.io"
license=("custom" "BSD" "CCPL")
depends=("git" "glu" "java-environment" "libglvnd" "unzip")
optdepends=("android-sdk" "android-studio" "dart" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "perl" "python")
makedepends=("python")
provides=("${pkgname%-dev}")
conflicts=("${pkgname%-dev}")
backup=("opt/${pkgname%-dev}/packages/${pkgname%-dev}_test/pubspec.yaml" "opt/${pkgname%-dev}/packages/${pkgname%-dev}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname%-dev}.install"
source=(
  "${pkgname%-dev}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra/releases/dev/linux/${pkgname%-dev}_linux_${pkgver/_/-}-dev.tar.xz"
  "${pkgname%-dev}.sh"
  "${pkgname%-dev}.csh"
)
sha256sums=(
  "32ab218a701f809af722ba1e30f9196832515da9284f4703e227b0b0ce6e3df0"
  "1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a"
  "7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f"
)

build() {
  cd "${srcdir}/${pkgname%-dev}"
  "${srcdir}/${pkgname%-dev}/bin/${pkgname%-dev}" doctor
}

package() {
  rm -rf "${srcdir}/${pkgname%-dev}/bin/cache" "${srcdir}/${pkgname%-dev}/.pub-cache"
  install -Dm644 "${srcdir}/${pkgname%-dev}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname%-dev}.sh" "${pkgdir}/etc/profile.d/${pkgname%-dev}.sh"
  install -Dm755 "${srcdir}/${pkgname%-dev}.csh" "${pkgdir}/etc/profile.d/${pkgname%-dev}.csh"
  install -dm755 "${pkgdir}/opt/${pkgname%-dev}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${pkgname%-dev}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${pkgname%-dev}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${pkgname%-dev}" -type f -exec chmod a+r {} +
  chmod a+rw "${pkgdir}/opt/${pkgname%-dev}/version"
  chmod 755 "${pkgdir}/opt/${pkgname%-dev}/bin"
  ln -s "/opt/${pkgname%-dev}/bin/${pkgname%-dev}" "${pkgdir}/usr/bin/${pkgname%-dev}"
}
