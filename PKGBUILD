# Maintainer: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

pkgname=hipchat
pkgver=4.0.1641
pkgrel=1
pkgdesc="Persistent group chat using XMPP"
arch=('x86_64')
url="https://www.hipchat.com/linux"
license=('custom')
depends=('fontconfig' 'libgl' 'libltdl' 'libxslt' 'hicolor-icon-theme'
         'libxcomposite' 'libxcursor' 'libxkbcommon' 'libxrandr' 'libxslt' 'libxss'
         'libpulse' 'xcb-util-keysyms' 'nss')
source=("https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${pkgver}-Linux.deb" "license.html")
sha1sums=('efc3f0cdc698fb80945355c7363e75859dfa7e87'
          'd57436db297ab4313a5964bba05060e2c7e93e70')

prepare() {
  cd "${srcdir}"
  mkdir "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  tar xzf "${srcdir}"/data.tar.gz
}

package() {
  install -D -m644 "${srcdir}/license.html" \
          "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
  cp -R "${srcdir}/${pkgname}-${pkgver}"/{opt,usr} "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -nsf "/opt/HipChat4/bin/HipChat4" "${pkgdir}/usr/bin/hipchat4"
}
