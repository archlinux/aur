# Contributor: David Sotelo <dvsotelo@gmail.com>
# Contributor: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=portecle
pkgver=1.11
pkgrel=2
pkgdesc="User friendly GUI application for creating, managing and examining key stores."
arch=('any')
url="http://portecle.sourceforge.net/"
license=('GPL')
depends=('java-environment' 'bash' 'desktop-file-utils')
install='portecle.install'
source=(https://github.com/scop/portecle/releases/download/v$pkgver/portecle-$pkgver.zip
        portecle.sh)
sha256sums=('75da1d5552979f3310adf4c93f90da00b56dfa12424ab52047c0c937ab6709bb'
            '86e003e596b6e9c031b63482d794ac4ccb16dee864bedbef69c9bc64e24b4763')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 ${srcdir}/portecle.sh ${pkgdir}/usr/bin/portecle
  install -D -m644 portecle.jar ${pkgdir}/usr/share/java/${pkgname}/portecle.jar
  install -D -m644 bcprov.jar ${pkgdir}/usr/share/java/${pkgname}/bcprov.jar
  install -D -m644 bcpkix.jar ${pkgdir}/usr/share/java/${pkgname}/bcpkix.jar

  install -D -m644 net.sf.portecle.desktop ${pkgdir}/usr/share/applications/portecle.desktop

  # Icons
  for i in 16 32 48 64 96 128 192 256 512; do
    for ico in `ls ${srcdir}/${pkgname}-${pkgver}/icons/${i}x${i}/*.png`; do
      install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/${i}x${i}/${ico##*/} \
      ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${ico##*/}
    done
  done
}