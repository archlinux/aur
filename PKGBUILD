# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn1112
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license=('unknown')
depends=('')
makedepends=('p7zip')
replaces=('vlmcsd')
conflicts=('vlmcsd')
source=('http://rgho.st/download/7pwJPNKJb/4b37e7872fa564219b51016e31ba6e3759e2f1fe/4b37e7872fa564219b51016e31ba6e3759e2f1fe/vlmcsd-1112-Hotbird64-Source-only.7z'
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=('bf56987924dd4a27bccec79d0983efdb041a3302191ab943d5b61c7e9969ba53'
            'c145194521ebf5eadc858d89b77a468f878c9a6e1699130ff9822e133ba6917f')

prepare() {
  cd "${srcdir}"
  7z x -p2018 "${srcdir}/vlmcsd-1112-Hotbird64-Source-only.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
}

build() {
  cd "${srcdir}/vlmcsd"
  make
}

package(){
  cd "${srcdir}/vlmcsd"
  install -Dm 755 bin/vlmcsd ${pkgdir}/usr/bin/vlmcsd
  install -Dm 755 bin/vlmcs ${pkgdir}/usr/bin/vlmcs

  install -Dm 644 etc/vlmcsd.ini ${pkgdir}/etc/vlmcsd.ini
  install -Dm 644 etc/vlmcsd.kmd ${pkgdir}/etc/vlmcsd.kmd

  install -Dm 644 man/vlmcs.1 "${pkgdir}/usr/share/man/man1/vlmcs.1"
  install -Dm 644 man/vlmcsd.7 "${pkgdir}/usr/share/man/man7/vlmcsd.7"
  install -Dm 644 man/vlmcsd.8 "${pkgdir}/usr/share/man/man8/vlmcsd.8"
  install -Dm 644 man/vlmcsd.ini.5 "${pkgdir}/usr/share/man/man5/vlmcsd.ini.5"
  install -Dm 644 man/vlmcsd-floppy.7 "${pkgdir}/usr/share/man/man7/vlmcsd-floppy.7"
  install -Dm 644 man/vlmcsdmulti.1 "${pkgdir}/usr/share/man/man1/vlmcsdmulti.1"

  # Create vlmcsd service
  install -Dm 644 ${srcdir}/vlmcsd.service ${pkgdir}/usr/lib/systemd/system/vlmcsd.service
}
