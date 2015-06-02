# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Juhani Kurki <coldfinger@last4seasons.net>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=sshmenu
pkgver=3.18
pkgrel=4
pkgdesc="GNOME panel applet that allows you to start up an SSH connection in a new terminal window with a single click."
arch=('i686' 'x86_64')
url="http://sshmenu.sourceforge.net/"
license=("BSD")
# You can use 'x11-ssh-askpass' instead of 'gnome-ssh-askpass2' to save having to build more packages from the AUR
depends=('openssh' 'gnome-ssh-askpass2' 'ruby' 'ruby-gtk2' 'ruby-gnome2' 'ruby-gconf2' 'ruby-panelapplet2' 'gnome-terminal')
source=("http://downloads.sourceforge.net/sshmenu/$pkgname-$pkgver.tar.gz")
md5sums=('7e7f43135fd112be3c173ec8585d6b98')

package() {
	cd "$srcdir"/${pkgname}-$pkgver
  make DESTDIR="$pkgdir" install
	install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
	install -Dm644 License.txt "$pkgdir"/usr/share/licenses/$pkgname

  # Hack workaround for ruby upgrades - thanks to coopstah13
  msg "Implementing hacky workaround for ruby updates"
  cd "$pkgdir"/usr/lib/ruby
  mv 1.8 1.9.1
  sed \
    -e 's|ftools|fileutils|g' \
    -i 1.9.1/sshmenu.rb
}

# vim:set ts=2 sw=2 et:
