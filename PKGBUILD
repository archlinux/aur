# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=remotebox
pkgver=3.7
pkgrel=1
pkgdesc="Open Source VirtualBox Client with Remote Management"
arch=('any')
url="https://remotebox.knobgoblin.org.uk/"
license=('GPL-2.0-only')
depends=('perl' 'perl-soap-lite' 'perl-gtk3' 'perl-regexp-common' 'perl-file-which')
optdepends=('freerdp: RDP client used for remote display by default (xfreerdp)'
            'rdesktop: alternative RDP client'
            'tigervnc: VNC client for guests using a VNC server')
source=("https://remotebox.knobgoblin.org.uk/downloads/RemoteBox-${pkgver}.tar.bz2")
sha256sums=('66b55deb1807f897b84f2a91d2b2772f98c59da17ff038c800624cbf3393777f')

prepare() {
  cd "RemoteBox-${pkgver}"
  sed -i 's|\$Bin/share/remotebox|/usr/share/remotebox|' remotebox
}

package() {
  cd "RemoteBox-${pkgver}"
  install -Dm755 remotebox remotebox-web -t "$pkgdir/usr/bin/"
  install -dm755 "$pkgdir/usr/share/remotebox"
  cp -r --no-preserve=ownership share/remotebox/. "$pkgdir/usr/share/remotebox/"
  install -Dm644 share/remotebox/icons/remotebox.png "$pkgdir/usr/share/pixmaps/remotebox.png"
  install -Dm644 packagers-readme/remotebox.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packagers-readme/remotebox.appdata.xml "$pkgdir/usr/share/metainfo/remotebox.appdata.xml"
  install -Dm644 docs/changelog.txt docs/appliance-changelog.txt -t "$pkgdir/usr/share/doc/remotebox/"
}
