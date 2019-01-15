#Maintainer:  Kr1ss <kr1ss.x@yandex.com>
#Author:      Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=social-engineer-toolkit
pkgver=7.7.9
pkgrel=1
pkgdesc="The Social-Engineer Toolkit (SET)"
arch=("any")
url="https://github.com/trustedsec/social-engineer-toolkit"
license=("custom")
makedepends=("python2")
depends=("python2-pexpect" "python2-crypto" "python2-requests"
         "python2-pyopenssl" "python2-pefile" "impacket"
         "python2-pillow" "python2-qrcode" "python2-beautifulsoup4")
optdepends=("metasploit")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trustedsec/social-engineer-toolkit/archive/${pkgver}.tar.gz"
        "setoolkit"{,.sig})
sha512sums=('f9226428f14fb15328a83719d6636c356b331e1d9d92fd0f22438ed6c3119fe9e464e8a5838cba9fe5c1dda1d955266facc93f4325c73127085099783a7b4d77'
            '130df5c3be2a75466933c086a10194a8e276b699698389af1528d2aa0f445d1dd41a82bf27e01749d59481df3d1071ac37605c4ee3e57c8bf99dd2410dd23a0b'
            'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

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
