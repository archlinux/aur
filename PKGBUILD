# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=xnee
pkgver=3.19
pkgrel=1
pkgdesc="A program to record, distribute, and replay X (X11) protocol data"
arch=('x86_64')
url="http://xnee.wordpress.com/"
license=('GPL3')
depends=('gtk2' 'libxtst')
makedepends=('texinfo')
optdepends=('xosd: feedback support')
options=('!emptydirs')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz
        gnee.desktop)
sha256sums=('52a41e5cf62f81b7a3e5b58124eb3565e1e12028abda63f547fbbe0d98a2c212'
            'de42d419a46083e39a9b6d60c045c1cd68deb793cc5166a86df81dff608387c1')

#unsolved FS#51027 - [xnee] 'gnee' not recording mouse/keyboard 

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-gui --enable-lib --disable-static --disable-static-programs
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

#.desktop file
  install -Dm644 "${srcdir}"/gnee.desktop "${pkgdir}"/usr/share/applications/gnee.desktop
}
