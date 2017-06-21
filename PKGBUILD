#Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname="social-engineer-toolkit"
pkgver=7.6.3
pkgrel=1
pkgdesc="The Social-Engineer Toolkit (SET)"
arch=("any")
url="https://github.com/trustedsec/social-engineer-toolkit"
license=("custom")
makedepends=("python2")
depends=("python2-pexpect" "python2-crypto" "python2-requests"
         "python2-pyopenssl" "python2-pefile" "impacket"
         "python2-pillow" "python2-qrcode" "python2-beautifulsoup3")
optdepends=("metasploit")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trustedsec/social-engineer-toolkit/archive/${pkgver}.tar.gz"
        "setoolkit")
sha512sums=('08cc1a568141e0af94eacf9123a7059b318203e09a25e82019d66b1dd54fbde02207fb5b1164c0464f837a26152d7ce79cba4aa7034d743c3af21669a76162cd'
            '130df5c3be2a75466933c086a10194a8e276b699698389af1528d2aa0f445d1dd41a82bf27e01749d59481df3d1071ac37605c4ee3e57c8bf99dd2410dd23a0b')

build() {
  cd "${pkgname}-${pkgver}"
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  mkdir -p "${pkgdir}/usr/share/setoolkit"
  install -D -m755 "${srcdir}/setoolkit" "${pkgdir}/usr/bin/setoolkit"
  cd "${pkgname}-${pkgver}"
  cp -r * "${pkgdir}/usr/share/setoolkit"
}
