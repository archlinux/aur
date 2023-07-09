# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sulis-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="Turn based tactical RPG with several campaigns, written in Rust"
arch=('x86_64')
url="https://www.sulisgame.com"
license=('GPL3')
provides=('sulis')
depends=('alsa-lib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Grokmoo/sulis/releases/download/${pkgver}/sulis-${pkgver}-linux64.zip"
"sulis.desktop")
sha256sums=('79fad49f64fc50d61230b1333f1f592f021c97303ee6a239828b06adb8d92d67'
            'c8a9dc17736d30d5780611dda44346285ece0fb415996b75b92cc8491de6d90c')

prepare() {
  cd "${srcdir}/sulis"
  echo "#!/bin/sh
  cd /opt/sulis
  ./sulis" > sulis.sh
  chmod 755 sulis.sh
}

package() {
  cd "${srcdir}/sulis"
  mkdir -p ${pkgdir}/opt/sulis
  cp -R ${srcdir}/sulis/* ${pkgdir}/opt/sulis
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/sulis/sulis.sh ${pkgdir}/usr/bin/sulis
  install -Dm544 ${startdir}/sulis.desktop  ${pkgdir}/usr/share/applications/sulis.desktop
}
