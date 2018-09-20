# Current Maintainer: sigmacool
# Original Packager:  sigmacool

pkgname=lanshare
pkgver=1.2.1
pkgrel=4
pkgdesc="LAN Share is a cross platform local area network file transfer application, built using Qt GUI framework."
arch=('x86_64')
url="https://github.com/abdularis/LAN-Share"
license=('GPL')
depends=('qt5-base')
optdepends=()
options=()
source=(
	"https://github.com/abdularis/LAN-Share/releases/download/1.2.1/lanshare_1.2.1-1_amd64.deb"
        "https://raw.githubusercontent.com/abdularis/LAN-Share/master/packaging/linux/debian/LANShare.desktop"
        "https://raw.githubusercontent.com/abdularis/LAN-Share/master/packaging/linux/debian/lanshare-icon.png"
        "https://raw.githubusercontent.com/abdularis/LAN-Share/master/LICENSE"
        "https://raw.githubusercontent.com/abdularis/LAN-Share/master/README.md"
)        

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  tar xf  data.tar.xz 
  mv README.md README
}
package() {

  cp -r usr/ "$pkgdir"

  install -Dm 0755 "$pkgdir/usr/lib/LANShare/LANShare" "$pkgdir/usr/bin/LANShare"

  mkdir -p "$pkgdir/usr/share/applications"
  sed -i '$ d' LANShare.desktop
  install -Dm 644  LANShare.desktop "$pkgdir/usr/share/applications/LANShare.desktop"

  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -Dm 644 lanshare-icon.png "$pkgdir/usr/share/pixmaps/lanshare-icon.png"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README  "${pkgdir}/usr/share/doc/${pkgname}/README"

}

