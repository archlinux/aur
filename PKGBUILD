# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=monkeyjump-git
pkgver=a6fcea4
pkgrel=1
pkgdesc='Minimalistic GUI for playing Go with GnuGo and other GTP applications'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/monkeyjump'
license=('GPL2')
depends=('python2-pygame' 'gnugo')
makedepends=('setconf' 'python2-setuptools')
backup=('etc/monkeyjump/gnugocmd.conf' 'etc/monkeyjump/theme.conf' 'etc/monkeyjump/keybindings.conf')
source=('monkeyjump::git://github.com/xyproto/monkeyjump.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${pkgname%-git}"

  setconf monkeyjump CONFDIR \"/etc/monkeyjump\"
  setconf monkeyjump THEMEDIR \"/usr/share/monkeyjump/themes\"
}

package() {
  cd "${pkgname%-git}"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 monkeyjump "$pkgdir/usr/bin/monkeyjump"
  install -d "$pkgdir/etc/monkeyjump" "$pkgdir/usr/share/monkeyjump/themes"
  install -Dm644 conf/* "$pkgdir/etc/monkeyjump/"
  cp -r themes/* "$pkgdir/usr/share/monkeyjump/themes/"
}

# vim:set ts=2 sw=2 et:
