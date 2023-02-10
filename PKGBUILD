# Maintainer: Marc Riera <marcriera@softcatala.org>

pkgname=okapi-apps
pkgver=1.45.0
pkgrel=1
pkgdesc="Cross-platform and free open-source set of applications that offer extensive support for localizing and translating documentation and software."
arch=('x86_64')
url="https://okapiframework.org/"
license=('Apache')
depends=('java-runtime' 'gtk2')
source=(https://okapiframework.org/binaries/main/${pkgver}/okapi-apps_gtk2-linux-x86_64_${pkgver}.zip
        checkmate.desktop
        rainbow.desktop
        ratel.desktop
        https://okapiframework.org/wiki/images/0/0c/CheckMateIcon.png
        https://okapiframework.org/wiki/images/8/8f/RatelIcon.png)
sha256sums=('8e81363a667d80199bc7978386fb7515d5751939020dffb2eda674aaf5c45374'
            '6578cdfdc0e745a231f89fb45e5fb2e2950598cb0795288d0a66855c0cc8a3b7'
            'e2fb58c6a2430ad5356ba356cfcbe965cabc2b8bb22b9c53ebdfca9eccc34f86'
            '2bbbd39c56e42f51c17a5a47d83eac3bcc829d9198fae629df7e3ff8cacf30e1'
            '858e8bb7d680ce480ee0a6a7c5a6c3e951f14dcd6e78009a700406e484c6ce08'
            'c57ef037dcd78be1983b3c03360e0d09b3c6f5ae4116d7f0968a0aa3fcd8bc85')

package() {
  cd "${srcdir}"

  # Point executables to installation folder
  sed -i 's%`dirname $0`%/usr/share/java/'${pkgname}'%g' *.sh

  # Install everything to installation folder
  install -d "${pkgdir}"/usr/{bin,share/java/${pkgname}}
  cp -r * "${pkgdir}"/usr/share/java/${pkgname}

  # Link executables
  ln -s /usr/share/java/${pkgname}/checkmate.sh "${pkgdir}"/usr/bin/checkmate
  ln -s /usr/share/java/${pkgname}/rainbow.sh "${pkgdir}"/usr/bin/rainbow
  ln -s /usr/share/java/${pkgname}/ratel.sh "${pkgdir}"/usr/bin/ratel
  ln -s /usr/share/java/${pkgname}/tikal.sh "${pkgdir}"/usr/bin/tikal

  # Install icons and desktop files
  install -Dm644 "${srcdir}"/CheckMateIcon.png "${pkgdir}"/usr/share/java/${pkgname}/resources/CheckMate.png
  install -Dm644 "${srcdir}"/RatelIcon.png "${pkgdir}"/usr/share/java/${pkgname}/resources/Ratel.png
  install -Dm644 "${srcdir}"/checkmate.desktop "${pkgdir}"/usr/share/applications/checkmate.desktop
  install -Dm644 "${srcdir}"/rainbow.desktop "${pkgdir}"/usr/share/applications/rainbow.desktop
  install -Dm644 "${srcdir}"/ratel.desktop "${pkgdir}"/usr/share/applications/ratel.desktop

  # Remove unnecessary files
  rm "${pkgdir}"/usr/share/java/${pkgname}/*.{zip,desktop,png}
}
