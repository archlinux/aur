# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=daloradius
pkgver=1.1.2
_pkgver=1.1-2
pkgrel=1
pkgdesc="An advanced RADIUS web platform aimed at managing Hotspots and general-purpose ISP deployments."
arch=('any')
url="http://daloradius.com/"
# php-pear is required to install the php 'db' module
depends=('php-pear')
install="$pkgname.install"
license=('GPLv2')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$_pkgver.zip")
md5sums=('799213d53fb000ffff16de4d932b848b')

package() {
  _INST_DIR="usr/share/webapps/$pkgname"
  _CONF_DIR="etc/webapps/$pkgname"
  _DOCS_DIR="usr/share/$pkgname"

  # Install webroot files
	install -dm755 "$pkgdir"/$_INST_DIR
	cp -r "$srcdir"/$pkgname/* "$pkgdir"/$_INST_DIR

  # Configuration files
  mkdir -p "$pkgdir"/$_CONF_DIR
  mv "$pkgdir"/$_INST_DIR/library/daloradius.conf.php.sample "$pkgdir"/$_CONF_DIR/
  mv "$pkgdir"/$_INST_DIR/library/daloradius.conf.php "$pkgdir"/$_CONF_DIR/
  ln -sf /$_CONF_DIR/daloradius.conf.php "$pkgdir"/$_INST_DIR/library/daloradius.conf.php

  # Docs
  install -dm0755 "$pkgdir"/$_DOCS_DIR/
  for x in README.md LICENSE FAQS INSTALL INSTALL.quick ; do
    mv "$pkgdir"/$_INST_DIR/$x "$pkgdir"/$_DOCS_DIR/
  done

  # Fix permissions
  chown -R 33:33 "$pkgdir"/$_INST_DIR
  chmod -R u=rwX,g=rX,o= "$pkgdir"/$_INST_DIR
  chown -R 33:33 "$pkgdir"/$_CONF_DIR
  chmod -R u=rwX,g=rX,o= "$pkgdir"/$_CONF_DIR
  chown -R 0:0 "$pkgdir"/$_DOCS_DIR
  chmod -R a=rX "$pkgdir"/$_DOCS_DIR
}

# vim:set ts=2 sw=2 et:
