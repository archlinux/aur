# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn1107
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license=('unknown')
depends=('glibc')
makedepends=('p7zip')
replaces=('vlmcsd')
conflicts=('vlmcsd')
source=('vlmcsd.7z::http://polariton.ad-file.net/download/899VxBTxb/96f186a4a09898a5ae25c561def369ef61180893/96f186a4a09898a5ae25c561def369ef61180893/vlmcsd-1107-2016-12-12-Hotbird64-source-only.7z'
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=("c71a5ed0c5066f6021532b9a7a6219565c486d721878d3a23a87611a6886a29d"
            "d6e0eafab2223e83a265ac9879217189e5a17a79ccf7323f21c9d8916cc10a82")
noextract=('vlmcsd.7z')

prepare() {
  cd "${srcdir}"
  7z x -p2016 "${srcdir}/vlmcsd.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
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
