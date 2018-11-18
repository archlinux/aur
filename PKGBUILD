# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=vncviewer-jar
pkgver=1.3.10
pkgrel=5
pkgdesc="VNC viewer java applet"
arch=("any")
url="http://www.tightvnc.com"
license=("GPL2")
conflicts=("tightvnc")
depends=("java-runtime<=8")
makedepends=("java-environment<=8")
source=("https://www.tightvnc.com/download/${pkgver}/tightvnc-${pkgver}_javasrc.tar.gz"
        "vncviewer-jar.patch")
md5sums=("5dc173c83fadfea5da0dd10ed01ab7e3"
         "fcd887227674c65a55fc1adb9d971073")
sha1sums=("5dd074d6302732a08ba847c45413d566abf6b7e7"
          "43b10b5ed51bd3b84bdfe2e98b433b9df495403d")
sha256sums=("465a6c90d362029152ea16d0b8e2c29f772b06eeec6c561278390f73d64ec6ec"
            "4c1dabcfd1aae53db0aa3519303073f3fe40168364d4b33e31354a142bc38128")

prepare() {
  cd "${srcdir}/vnc_javasrc"
  patch -Np1 -i "${srcdir}/vncviewer-jar.patch"
}

build() {
  cd "${srcdir}/vnc_javasrc"
  make clean
  make all
}

package() {
  cd "${srcdir}/vnc_javasrc"
  install -dm755 "${pkgdir}/usr/share/vnc/classes"
  make install INSTALL_DIR="${pkgdir}/usr/share/vnc/classes"
}
