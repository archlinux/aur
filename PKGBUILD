# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn1108
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license=('unknown')
depends=('glibc')
makedepends=('p7zip')
replaces=('vlmcsd')
conflicts=('vlmcsd')
source=('vlmcsd.7z::http://meson.ad-file.net/download/8z9BVlkVC/2d37e948339d0478b9f86ec87c154715e6fa8fe5/b0df743fdaaf9eb3284787dea3e83967f5160645/vlmcsd-1108-2017-01-19-Hotbird64-source-only.7z'
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=("fffa42d56e9b1d793895d4e481cdcf3541885b5d6f176b6934cea74f3c2650c3"
            "c145194521ebf5eadc858d89b77a468f878c9a6e1699130ff9822e133ba6917f")
noextract=('vlmcsd.7z')

prepare() {
  cd "${srcdir}"
  7z x -p2017 "${srcdir}/vlmcsd.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
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
