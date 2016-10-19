# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=eme
pkgver=0.10.0
pkgrel=1
pkgdesc="Elegant Markdown Editor"
arch=('i686' 'x86_64')
depends=('electron')
makedepends=('npm')
url="https://github.com/FredrikNoren/ungit"
license=('MIT')
source=("https://github.com/egoist/eme/archive/v${pkgver}.tar.gz"
        "eme"
        "eme.desktop")
sha256sums=('76e12e998222dba4ff1a080fadc676cae7fe6900491281775562ba220840b6b0'
            'SKIP'
            'SKIP')

install="eme.install"

build()
{
  cd ${pkgname}-${pkgver}
  npm run install:all
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
