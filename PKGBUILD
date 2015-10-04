# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Alexander Baldeck <lex@tentriplenine.com>

pkgname=charles
pkgver=3.11
pkgrel=1
pkgdesc="Web debugging proxy application"
arch=(any)
url="http://www.charlesproxy.com"
license=('custom' 'custom:bounce' 'APACHE')
depends=('java-runtime' 'hicolor-icon-theme')
source=(http://www.charlesproxy.com/assets/release/${pkgver}/charles-proxy-${pkgver}.tar.gz
        charles-arch.patch
        charles.desktop)
install=charles.install
md5sums=('de3963832658950c8d3abd96c7a1d3d8'
         '8ddaffe8d0ff4255a66a954bc445d436'
         '3f788e0263cb50a545855199c8c60b1e')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ${srcdir}/charles-arch.patch
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m755 ${srcdir}/${pkgname}/bin/charles \
    ${pkgdir}/usr/bin/charles

  for fn in ${srcdir}/${pkgname}/lib/*.jar; do
    install -D -m644 ${fn} \
      ${pkgdir}/usr/share/java/${pkgname}/$(basename ${fn})
  done

  for dim in 16 32 48 64 128 256 512; do
    install -D -m644 ${srcdir}/${pkgname}/icon/charles_icon${dim}.png \
      ${pkgdir}/usr/share/icons/hicolor/${dim}x${dim}/apps/charles.png
  done

  install -D -m644 ${srcdir}/${pkgname}/icon/charles_icon.svg \
    ${pkgdir}/usr/share/icons/hicolor/scalable/apps/charles.svg
  install -D -m644 ${srcdir}/${pkgname}/doc/licenses/bounce-license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/bounce-license.txt
  install -D -m644 ${srcdir}/charles.desktop \
    ${pkgdir}/usr/share/applications/charles.desktop
}

# vim:set ts=2 sw=2 et:
