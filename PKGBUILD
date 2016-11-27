#Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

_pkgname="social-engineer-toolkit"
pkgname="setoolkit"
pkgver=7.4.2
pkgrel=1
pkgdesc="The Social-Engineer Toolkit (SET)"
arch=("any")
url="https://github.com/trustedsec/social-engineer-toolkit"
license=("custom")
makedepends=("python2" "python2-setuptools")
depends=("python2-pexpect" "python2-crypto" "python2-requests"
         "python2-pyopenssl" "python2-pefile" "impacket" 
         "python2-pillow" "python2-qrcode" "python2-beautifulsoup3")
optdepends=("metasploit")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trustedsec/social-engineer-toolkit/archive/${pkgver}.tar.gz"
        "setoolkit")
sha512sums=('067e3e6b1ceffdc7804fed2055a95cf482f8efa22b4e94bcd898f390297403a1bbf79743e06d6d71653e4c8dd74e2a3825819023a735314ace672dbe9ba6898e'
            '130df5c3be2a75466933c086a10194a8e276b699698389af1528d2aa0f445d1dd41a82bf27e01749d59481df3d1071ac37605c4ee3e57c8bf99dd2410dd23a0b')

build() {
  cd "${_pkgname}-${pkgver}"
  python2 -m compileall .
  python2 -O -m compileall . 
}

package() {
  mkdir -p "${pkgdir}/usr/share/setoolkit"
  install -D -m755 "${srcdir}/setoolkit" "${pkgdir}/usr/bin/setoolkit"
  cd "${_pkgname}-${pkgver}"
  cp -r * "${pkgdir}/usr/share/setoolkit"
}
