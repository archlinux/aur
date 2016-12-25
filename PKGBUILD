# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=eme
pkgver=0.12.0
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
sha256sums=('461ed652bf20d250845efe522090b1c4c66b45c52dee16100d6d9d90fad06cec'
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
