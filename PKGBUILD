# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

pkgname=hipchat
pkgver=4.30.5.1682
pkgrel=1
pkgdesc='Persistent group chat using XMPP'
arch=('x86_64')
url='https://www.hipchat.com/linux'
license=('custom')
depends=('fontconfig' 'libgl' 'libltdl' 'libxslt' 'hicolor-icon-theme'
         'libxcomposite' 'libxcursor' 'libxkbcommon' 'libxrandr' 'libxslt' 'libxss'
         'libpulse' 'xcb-util-keysyms' 'nss' 'openssl-1.0')
source=("https://atlassian.artifactoryonline.com/artifactory/hipchat-apt-client/pool/HipChat4-${pkgver}-Linux.deb"
        license.html
        fix-seccomp-sandbox-bug.patch)
b2sums=('b9f98bb3d95d8728e1f3fcb2d85baa4d9f872a1f04587a22120e67dcbe35bffa77b5b075924e9394bd1289ea5c51031ee9d5960fd906204f0dbd73dca67d139e'
        '18e2c8c3ea6260ae2c87827ec3c549400ac83ce7aae7cdab432074623f03267e20c5219e19e389ef0aed8f93cc36b4e94735253bfe2f4f2be35f7a6789ff1fd8'
        '8bbed911beb86a41a7159e1c397d4478244e8bee1649fd3a5fa551351d4e525164328dc93c553e4b7151ee3dcce1c2c23cdc8d1917ff8c39a2a1fedae5930903')

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
