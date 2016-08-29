# Maintainer: Luigi Guevara <luigi.t.guevara@killua.me>
pkgname=pomello
pkgver=0.7.5
pkgrel=1
pkgdesc="Stay Focused. Accomplish more."
arch=('x86_64' 'i686')
url="http://www.pomelloapp.com/"
license=('custom')
depends=('libsystemd')
makedepends=('tar' 'binutils')
install='pomello.install'
source_i686=("http://www.pomelloapp.com/download/linux?package=deb&arch=32")
source_x86_64=("http://www.pomelloapp.com/download/linux?package=deb&arch=64")
options=(!strip)
md5sums_i686=('9dfc6074ae2b887f827a1f246ec85a2d')
md5sums_x86_64=('dc64163a290dd60c57c5f5a986fe316d')

prepare() {
  cd "$srcdir"

  ar x "$Pomello_${pkgver}.deb"
}

package() {
  cd "$srcdir"

  tar -C "$pkgdir" -xf data.tar.xz

  mkdir -p "$pkgdir/opt/Pomello/lib"
  ln -nsf /usr/lib/libudev.so.1 "$pkgdir/opt/Pomello/lib/libudev.so.0"

  install -D -m644 "${srcdir}/opt/Pomello/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -nsf "/opt/Pomello/Pomello" "${pkgdir}/usr/bin/pomello"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "$pkgdir/usr/share/applications/Pomello.desktop"
  sed -e 's#/opt/Pomello/Pomello#/usr/bin/pomello#' -i "$pkgdir/usr/share/applications/Pomello.desktop"
}

# vim:set ts=2 sw=2 et:
