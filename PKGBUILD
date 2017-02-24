# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=eme
pkgver=0.13.0
pkgrel=1
pkgdesc="Elegant Markdown Editor."
arch=('i686' 'x86_64')
depends=('electron')
makedepends=('npm')
url="https://eme.moe/"
license=('MIT')
source=("https://github.com/egoist/eme/archive/v${pkgver}.tar.gz"
        "eme"
        "eme.desktop")
sha256sums=('97edbcd37016cd1460041d398278b717005a51a4bfabb5588592505d6870372f'
            'SKIP'
            'SKIP')

install="eme.install"

build()
{
  cd ${pkgname}-${pkgver}
  npm install
  npm run build
}

package()
{
  cd ${pkgname}-${pkgver}/app
  npm install -g --prefix "${pkgdir}/usr"

  cd ${srcdir}
  install -Dm0755 eme "${pkgdir}/usr/bin/eme"
  install -Dm0644 eme.desktop "${pkgdir}/usr/share/applications/eme.desktop"
}
