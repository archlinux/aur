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

pkgname=daloradius
pkgver=0.9.9
_pkgver=0.9-9
pkgrel=2
pkgdesc="An advanced RADIUS web platform aimed at managing Hotspots and general-purpose ISP deployments."
arch=('any')
url="http://daloradius.com/"
# php-pear is required to install the php 'db' module
depends=('php-pear')
install="$pkgname.install"
license=('GPLv2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$_pkgver.tar.gz")
md5sums=('b9284a14b180db2ce2c58e8b0b804a95')

package() {
  _INST_DIR="usr/share/webapps/$pkgname"
  _CONF_DIR="etc/webapps/$pkgname"
  _DOCS_DIR="usr/share/$pkgname"
  
  # Install webroot files
	install -dm755 "$pkgdir"/$_INST_DIR
	cp -r "$srcdir"/$pkgname-$_pkgver/* "$pkgdir"/$_INST_DIR
	
  # Configuration files
  mkdir -p "$pkgdir"/$_CONF_DIR
  mv "$pkgdir"/$_INST_DIR/library/daloradius.conf.php.sample "$pkgdir"/$_CONF_DIR/
  mv "$pkgdir"/$_INST_DIR/library/daloradius.conf.php "$pkgdir"/$_CONF_DIR/
  ln -sf /$_CONF_DIR/daloradius.conf.php "$pkgdir"/$_INST_DIR/library/daloradius.conf.php

  # Docs
  install -dm755 "$pkgdir"/$_DOCS_DIR/
  mv "$pkgdir"/$_INST_DIR/README        "$pkgdir"/$_DOCS_DIR/
  mv "$pkgdir"/$_INST_DIR/LICENSE       "$pkgdir"/$_DOCS_DIR/
  mv "$pkgdir"/$_INST_DIR/FAQS          "$pkgdir"/$_DOCS_DIR/
  mv "$pkgdir"/$_INST_DIR/INSTALL       "$pkgdir"/$_DOCS_DIR/
  mv "$pkgdir"/$_INST_DIR/INSTALL.quick "$pkgdir"/$_DOCS_DIR/
  
  # Fix permissions
  chown -R 33:33 "$pkgdir"/$_INST_DIR
  chmod -R u=rwX,g=rX,o= "$pkgdir"/$_INST_DIR
  chown -R 33:33 "$pkgdir"/$_CONF_DIR
  chmod -R u=rwX,g=rX,o= "$pkgdir"/$_CONF_DIR
  chown -R 0:0 "$pkgdir"/$_DOCS_DIR
  chmod -R a=rX "$pkgdir"/$_DOCS_DIR
}

# vim:set ts=2 sw=2 et:
