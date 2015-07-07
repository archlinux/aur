# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Alexander Baldeck <lex@tentriplenine.com>

pkgname=charles
pkgver=3.10.2
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
md5sums=('805512e302dc80902d171c42f53dd16e'
         '6bd40b93c0fdea93ed19a4015d0da283'
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
