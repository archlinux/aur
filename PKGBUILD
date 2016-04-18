# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages
# Contributor: Sven Schulz <omee@archlinux.de>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Moritz Alexander Esser <Moritz.Esser@rwth-aachen.de>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=fwlogwatch
pkgver=1.5
pkgrel=2
pkgdesc="A packet filter/firewall/IDS log analyzer"
arch=('i686' 'x86_64')
depends=('zlib>=1.0.9')
backup=(etc/conf.d/fwlogwatch)
url="http://fwlogwatch.inside-security.de/"
license=('GPL')
source=("http://fwlogwatch.inside-security.de/sw/$pkgname-$pkgver.tar.gz"
        'fwlogwatch'
        'fwlogwatch.conf')
md5sums=('0c55031e7d66518493607d2c30a3a5a5'
         'e10d41244780c74280d27794ca6a6525'
         '35dc2f301904b2b03ef688e2e2edae53')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -e 's/sbin/bin/g' -i Makefile
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/{etc,usr/{bin,share/man/man8}}
  mkdir -p "$pkgdir"/usr/share/locale/{de,ja,pt,sv,zh_CN,zh_TW}/LC_MESSAGES

  make INSTALL_DIR="$pkgdir"/usr install
  make CONF_DIR="$pkgdir"/etc install-config
  make LOCALE_DIR="$pkgdir"/usr install-i18n

  install -D -m644 "$srcdir"/fwlogwatch.conf "$pkgdir"/etc/conf.d/fwlogwatch
}
