# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=untrunc-gui-git
pkgver=r388.d286625
pkgrel=1
pkgdesc="Utility to restore a damaged (truncated) mp4, m4v, mov, 3gp video (with GUI)"
arch=('x86_64')
conflicts=('untrunc')
provides=('untrunc')
install='untrunc.install'
url="https://github.com/anthwlock/untrunc"
license=('GPL-2.0-only')
depends=('libvdpau' 'zlib' 'bzip2' 'libui')
makedepends=('yasm' 'git' 'libx11' 'gendesk')
source=("${pkgname}"::'git+https://github.com/anthwlock/untrunc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  gendesk -f -n --pkgname untrunc --pkgdesc "${pkgdesc}" --exec "untrunc-gui" --categories "AudioVideo;Video;Utility;AudioVideoEditing"
}

build() {
  cd $srcdir/$pkgname
  make untrunc-gui
} 

package() {
  install -Dm755 ${srcdir}/${pkgname}/untrunc ${pkgdir}/usr/bin/untrunc
  install -Dm755 ${srcdir}/${pkgname}/untrunc-gui ${pkgdir}/usr/bin/untrunc-gui
  install -Dm644 "${srcdir}/untrunc.desktop" "$pkgdir/usr/share/applications/untrunc.desktop"
}
