# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn1003
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license=('unknown')
depends=('glibc')
makedepends=('clang' 'p7zip')
replaces=('vlmcsd')
conflicts=('vlmcsd')
source=('vlmcsd.7z::http://meson.ad-file.net/download/7FfhSylL5/d1e2afc3fcc8386db8020d80b699ba65d4136b33/vlmcsd-svn1003-2016-08-27-Hotbird64-source-only.7z'
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=("a8dc74dff0b6b23b584547fce681ec2b3b741a3ff503053b6e19f7c6b86af343"
            "d6e0eafab2223e83a265ac9879217189e5a17a79ccf7323f21c9d8916cc10a82")
noextract=('vlmcsd.7z')

prepare() {
  cd "${srcdir}"
  7z x -p2016 "${srcdir}/vlmcsd.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
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
