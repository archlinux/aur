#Maintainer:  Kr1ss <kr1ss.x@yandex.com>
#Author:      Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=social-engineer-toolkit
pkgver=7.7.8
pkgrel=2
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
sha512sums=('4031e3f8ef3be8db4da0fb8e63609d329f82065eb28645dea6551be079fbe655077eb3e917ef523e58d72bd6eaeff37a758babf98c27ef6806f2446be107c9ee'
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
