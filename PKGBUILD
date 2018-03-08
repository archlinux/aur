# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=flutter
pkgver=beta
pkgrel=1
pkgdesc="Flutter is a new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=('any')
url="https://flutter.io"
license=("https://github.com/flutter/flutter/blob/master/LICENSE")
provides=(flutter)
depends=(android-sdk)
optdepends=(android-studio intellij-idea-community-edition intellij-idea-ultimate-edition)
source=("${pkgname}::git+https://github.com/${pkgname}/${pkgname}#branch=${pkgver}"
        "${pkgname}.install"
        "${pkgname}.sh"
        "${pkgname}.csh")
sha256sums=('SKIP'
            'b8eb8c1a38e961984fe7d26fc83a86f6aa1b362c4187a1fef55ce5cbc68a8d84'
            '67fa3da8f8e9a1bcd2858989fe6d7fe9958fb3990e1c3148cd246c40b8980cb0'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

build() {
    cd "${srcdir}/${pkgname}"
    bin/flutter doctor
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
  install -d "${pkgdir}/opt/${pkgname}/"
  cp -ra "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  chown -R "${USER}":users "${pkgdir}/opt/${pgkname}"
}
