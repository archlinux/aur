# Maintainer: Ole Ernst <olebowle at gmx dot com>
pkgname=gnome-shell-extension-timer-git
pkgver=20121103
pkgrel=1
pkgdesc="A simple timer extension for gnome-shell"
arch=('any')
url="http://github.com/olebowle/gnome-shell-timer"
license=('GPL3')
depends=('gnome-shell' 'python2')
makedepends=('git')
install="$pkgname.install"
source=("git://github.com/olebowle/gnome-shell-timer.git")
sha256sums=('SKIP')

package() {
  cd gnome-shell-timer
  install -Dm755 gnome-shell-timer-config.py "$pkgdir/usr/bin/gnome-shell-timer-config"
  install -Dm644 gnome-shell-timer-config.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gnome-shell-timer-config.svg"
  install -Dm644 utilities-timer-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/utilities-timer-symbolic.svg"
  install -Dm644 gnome-shell-timer-config.desktop "$pkgdir/usr/share/applications/gnome-shell-timer-config.desktop"
  install -Dm644 org.gnome.shell.extensions.timer.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.timer.gschema.xml"

  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "timer@olebowle.gmx.com" "$pkgdir/usr/share/gnome-shell/extensions/"

  cd po
  for _lang in */; do
    mkdir -p "$pkgdir/usr/share/locale/${_lang}LC_MESSAGES"
    msgfmt -cv -o "$pkgdir/usr/share/locale/${_lang}LC_MESSAGES/gnome-shell-timer.mo" "${_lang}gnome-shell-timer.po"
  done
}
