# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

pkgname=hipchat
pkgver=4.30.5.1680
pkgrel=2
pkgdesc='Persistent group chat using XMPP'
arch=('x86_64')
url='https://www.hipchat.com/linux'
license=('custom')
depends=('fontconfig' 'libgl' 'libltdl' 'libxslt' 'hicolor-icon-theme'
         'libxcomposite' 'libxcursor' 'libxkbcommon' 'libxrandr' 'libxslt' 'libxss'
         'libpulse' 'xcb-util-keysyms' 'nss' 'openssl-1.0')
source=("https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${pkgver}-Linux.deb"
        license.html
        fix-seccomp-sandbox-bug.patch)
sha512sums=('8ff9cd653c62044ec26f0eca7ef06ac7be6183ec1fc6052d27da11a079bd95d4971a79aefeec42c04ae9e78fd987dd44b15996fd9aaa3bfb937e71710d8f6121'
            '7e7d712a01edcb91fcd3759d77620ae53c5f24e6fc0ec311bec7eebf5736d643945c2600c9198261e47d0349ef358a6d673a446e15c7599c31b548c93f464f7d'
            '2c01bc2da7a0aa6bd1f943737949e3e84d56a1258f316e558c49e8474a86dec2c510eb5260f48ed0dbfd656801b73f69f4ea702a6f878f94e5e23bf12d67995f')

prepare() {
  mkdir ${pkgname}-${pkgver}
  tar xzf data.tar.gz -C ${pkgname}-${pkgver}
  cd hipchat-*
  patch -p0 -i "${srcdir}"/fix-seccomp-sandbox-bug.patch
}

package() {
  install -Dm644 "${srcdir}"/license.html "${pkgdir}"/usr/share/licenses/${pkgname}/license.html
  cp -R ${pkgname}-${pkgver}/{opt,usr} "${pkgdir}"
  mkdir -p "${pkgdir}"/usr/bin
  ln -nsf /opt/HipChat4/bin/HipChat4 "${pkgdir}"/usr/bin/hipchat4
  ln -nsf /usr/lib/libssl.so.1.0.0 "${pkgdir}"/opt/HipChat4/lib/
  ln -nsf libssl.so.1.0.0 "${pkgdir}"/opt/HipChat4/lib/libssl.so
  ln -nsf /usr/lib/libcrypto.so.1.0.0 "${pkgdir}"/opt/HipChat4/lib/
  ln -nsf libcrypto.so.1.0.0 "${pkgdir}"/opt/HipChat4/lib/libcrypto.so
}
