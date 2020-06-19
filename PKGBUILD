# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=flutter-dev
pkgver=1.20.0_0.0.pre
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-dev}.io"
license=("custom" "BSD" "CCPL")
depends=("bash" "git" "glu" "java-environment" "lib32-libglvnd" "unzip")
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
  "ab045973c3d9bf405b90ffa144ddb67288eb9f9e0d5406c38dcc599eb8de5abe"
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
  ln -s "/opt/${pkgname%-dev}/bin/${pkgname%-dev}" "${pkgdir}/usr/bin/${pkgname%-dev}"
}
