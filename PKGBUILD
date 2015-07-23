# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn796
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license='unknown'
depends=('glibc')
makedepends=('clang' 'p7zip')
replaces=('vlmcsd')
conflicts=('vlmcsd')
source=('vlmcsd.7z::http://higgs.rghost.ru/download/8cJHNJQxg/0956b238f0dd06e33ed304d72b3d9952e579e98d/vlmcsd-svn796-2015-07-18-Hotbird64-source-only.7z'
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=("2d49dc56fdae7093c5ce99619e1920242cfe97da9080be4eee5483874b9ee9b6"
            "bcaff9edeb0b215535d1d273283c5c5b79cbb652c5a1dfab6798e8b2a671ae7a")
noextract=('vlmcsd.7z')

prepare() {
  cd "${srcdir}"
  7z x -p2015 "${srcdir}/vlmcsd.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
}

build() {
  cd "${srcdir}/vlmcsd"
  mv "${srcdir}/vlmcsd/make_linux" "${srcdir}/vlmcsd/Makefile"
  CC=clang make
}

package(){
  cd "${srcdir}/vlmcsd"

  install -Dm 755 vlmcsd ${pkgdir}/usr/bin/vlmcsd
  install -Dm 755 vlmcs ${pkgdir}/usr/bin/vlmcs

  install -Dm 644 vlmcs.1 "${pkgdir}/usr/share/man/man1/vlmcs.1"
  install -Dm 644 vlmcsd.7 "${pkgdir}/usr/share/man/man7/vlmcsd.7"
  install -Dm 644 vlmcsd.8 "${pkgdir}/usr/share/man/man8/vlmcsd.8"

  # Create vlmcsd service
  install -Dm 644 ${srcdir}/vlmcsd.service ${pkgdir}/usr/lib/systemd/system/vlmcsd.service
}
