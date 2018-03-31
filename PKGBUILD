# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=flutter
pkgver=beta
pkgrel=3
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname}.io"
license=("custom:https://github.com/${pkgname}/${pkgname}/blob/master/LICENSE")
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
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/${pkgname}/${pkgname}#branch=${pkgver}"
        "${pkgname}.sh"
        "${pkgname}.csh")
sha256sums=("SKIP"
            "1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a"
            "7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f")

build() {
    cd "${srcdir}/${pkgname}"
    "bin/${pkgname}" doctor
}

package() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${srcdir}/${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
  install -d "${pkgdir}/opt/${pkgname}/"
  cp -ra "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  chown -R "${USER}":users "${pkgdir}/opt/${pgkname}"
  chmod a+r -R "${pkgdir}/opt/${pkgname}/bin/cache/dart-sdk/bin"
  chmod a+x "${pkgdir}/opt/${pkgname}/bin/cache/dart-sdk/bin"
  chmod a+x "${pkgdir}/opt/${pkgname}/bin/cache/dart-sdk/bin/snapshots"
  chmod a+x "${pkgdir}/opt/${pkgname}/bin/cache/dart-sdk/bin/snapshots/resources"
  chmod a+x "${pkgdir}/opt/${pkgname}/bin/cache/dart-sdk/bin/snapshots/resources/dartdoc"
}
