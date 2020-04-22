pkgname=jitsi-meet
pkgver=4039
pkgrel=1
pkgdesc="WebRTC JavaScript video conferences"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-meet"
license=("Apache")
makedepends=("git" "npm")
optdepends=("jicofo"
            "jitsi-videobridge"
            "nginx"
            "prosody")
backup=("opt/jitsi-meet/config.js"
        "opt/jitsi-meet/interface_config.js"
        "opt/jitsi-meet/logging_config.js")
options=("!strip")
source=($pkgname-$pkgver::https://github.com/jitsi/jitsi-meet/archive/$pkgver.tar.gz)
md5sums=('8c8e92686254a711122478b1bdad8fd3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install
  # Make fails with more than one thread
  make -j1
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/${pkgname}-${pkgver}/" "${pkgdir}/opt/jitsi-meet"
}
