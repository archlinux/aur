# Maintainer: Austin Keller <austin474@gmail.com>

_pkgname=roam-research
pkgname=roam-research
pkgver=0.0.13
pkgrel=1
pkgdesc="A note-taking tool for networked thought"
arch=('any')
url="https://roamresearch.com/"
license=('custom')
depends=()
source=("$_pkgname-$pkgver.tgz::https://roam-electron-deploy.s3.us-east-2.amazonaws.com/${_pkgname}_${pkgver}_amd64.deb")
md5sums=('1bd0ffd8618975d601bb93c0ae1741af')

prepare() {
  tar -xvf data.tar.xz
}

package() {
  cd "$srcdir"

  sed -i "s/\/opt\/Roam Research/\/opt\/$_pkgname/" usr/share/applications/roam-research.desktop

  install -d "$pkgdir"/{opt/$_pkgname,usr/share}
  cp -r opt/Roam\ Research/* -t "$pkgdir"/opt/$_pkgname
  cp -r usr/share/* -t "$pkgdir"/usr/share
  install -d "$pkgdir"/usr/share/icons/hicolor/1024x1024
  cp -r usr/share/icons/hicolor/0x0/* -t "$pkgdir"/usr/share/icons/hicolor/1024x1024
  install -d "$pkgdir"/usr/share/pixmaps
  install -D usr/share/icons/hicolor/0x0/apps/roam-research.png -t "$pkgdir"/usr/share/pixmaps
}
