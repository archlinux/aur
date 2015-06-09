# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=jfbterm-git
_commit=6392e5934275b48e90880c4c019f6e159de50e51
pkgver=6392e59
pkgrel=1
pkgdesc="multilingual terminal on Linux framebuffer"
arch=('i686' 'x86_64')
url=https://github.com/takeutch-kemeco/jfbterm-0.4.7.1
license=('GPL')
groups=('i18n')
provides=('jfbterm' 'jfbterm-git')
depends=('pcf-unifont')
backup=etc/jfbterm/jfbterm.conf
makedepends=('git')
optdepends=('mplus-bitmap-fonts' 'linux-fbcondecor' 'v86d')
source=("git+https://github.com/takeutch-kemeco/jfbterm-0.4.7.1.git#commit=$_commit"
jfbterm.conf)
md5sums=('SKIP' 
'0a443f24a98f18f9c5cc7d102d5a8ef1')

pkgver() {
  cd "$srcdir/${pkgname%-git}"-0.4.7.1
  git rev-parse --short $_commit
}

build() {
  cd "$srcdir/${pkgname%-git}"-0.4.7.1
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/jfbterm
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"-0.4.7.1
  make DESTDIR="$pkgdir/" install
  install -D -T fonts/vt100-graphics.pcf.gz "$pkgdir"/usr/share/fonts/jfbterm/vt100-graphics.pcf.gz
  install -D -T jfbterm.1 "$pkgdir"/usr/share/man/man1/jfbterm.1
  install -D -T jfbterm.conf.5 "$pkgdir"/usr/share/man/man5/jfbterm.conf.5
  install -D -T "$srcdir"/jfbterm.conf "$pkgdir"/etc/jfbterm/jfbterm.conf
}

# vim:set ts=2 sw=2 et:
