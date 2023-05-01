pkgname=xeres
pkgver=0.5.3
pkgrel=1
pkgdesc='A decentralized and secure application designed for communication and sharing.'
arch=('x86_64')
url="https://xeres.io"
license=('GPL')
depends_x86_64+=(xdg-utils)
source=("https://github.com/zapek/Xeres/releases/download/v0.5.3/xeres_0.5.3_amd64.deb")
sha512sums=('9178a2d56b806aaab9fe2fb36b567dee2e75e500cf47c7a13e3a3d7c3e95785eaa0e4e4244eb3e61d08b32fb7110b8bd0600b2e757e9e7970f72e87e79fbbbfb')


options=('!strip')
postinst=post.install

prepare() {
  cd "${srcdir}"
  tar --use-compress-program=unzstd -xvf data.tar.zst
}

package() {
  cd ${srcdir}
  install -d ${pkgdir}/opt/xeres
  cd opt/xeres
  cp -R * ${pkgdir}/opt/xeres

  install -Dm644 ${srcdir}/opt/xeres/lib/xeres-Xeres.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ${srcdir}/opt/xeres/lib/Xeres.png $pkgdir/usr/share/pixmaps/$pkgname.png
}