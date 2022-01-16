#maintainer: Jeremiah Ticket <seashellpromises@gmail.com>
_gitname='talking-dos-box'
pkgname="talking-dosbox-git"
pkgver=r3.1d2b27b
pkgrel=1
epoch=1
pkgdesc='A talking dosbox with screen reader.'
arch=('any')
url="https://gitlab.com/jticket1024/talking-dos-box"
license=('LGPL' 'unknown')
depends=('dosbox-x')
makedepends=('git')
provides=('talking-dosbox')
source=("git+https://gitlab.com/jticket1024/${_gitname}.git"
  'talking-dosbox.desktop'
  'talking-dosbox')
md5sums=('SKIP'
         '2e7cc61f8c131dcc0a86ef1ce8fad162'
         'a51b87908deaa075f024f74631d05208')
backup=(opt/talking-dosbox/dosbox-x.conf)
options=(!strip)
install=talking-dosbox.install
pkgver()
{
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  install -d "$pkgdir/opt/talking-dosbox/"
  install -Dm755 talking-dosbox "$pkgdir/usr/bin/talking-dosbox"
  install -d "$pkgdir/usr/share/applications/"
  install -Dm644 talking-dosbox.desktop "$pkgdir/usr/share/applications/talking-dosbox.desktop"
  cd "$srcdir/$_gitname"
cp -r dosbox-x.conf cdrive $pkgdir/opt/talking-dosbox/
}

# vim: set ts=2 sw=2 et:
