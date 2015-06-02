# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=dalbum
pkgver=144_174
pkgrel=1
pkgdesc="A free PHP photo album. It is small, easy to install and highly customizable at the same time. Features include slide shows, image comments, support for video and PDF files and many more."
arch=('any')
url="http://www.dalbum.org/"
license=('GPL')
depends=('imagemagick' 'php>=4.1')
backup=("etc/webapps/$pkgname/config.php")
source=("http://www.dalbum.org/${pkgname}${pkgver}.tar.gz")
md5sums=('f45dcea5c19ede643cf8e89ab2017767')

package() {
  _CONF_DIR="etc/webapps/$pkgname"
  _INST_DIR="usr/share/webapps/$pkgname"

  # Install webroot files
	install -dm755 "$pkgdir"/$_INST_DIR
	cp -r "$srcdir"/* "$pkgdir"/$_INST_DIR
	
  # Fix permissions
  chmod -R u=rwX,go=rX "$pkgdir/$_INST_DIR"

  # Move config file to /etc and symlink
  mkdir -p "$pkgdir"/$_CONF_DIR
  mv "$pkgdir"/$_INST_DIR/config/{*,.??*} "$pkgdir"/$_CONF_DIR
  rmdir "$pkgdir"/$_INST_DIR/config
  ln -sf $_CONF_DIR "$pkgdir"/$_INST_DIR/config
}

# vim:set ts=2 sw=2 et:
