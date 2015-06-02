# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

pkgname=pgsql-backup
pkgver=0.9.16
pkgrel=1
pkgdesc="Automatic rolling backups for PostgreSQL"
arch=('any')
url="http://fukawi2.nl/index.php?page=code-pgsql-backup"
license=('GPL')
depends=('coreutils' 'postgresql')
makedepends=('perl') # reqd for pod2man to make man page
backup=("etc/$pkgname.conf")
optdepends=('gzip: compression of backups'
            'bzip2: better compression of backups'
            'xz: even better compression of backups'
            'openssl: encryption of backups')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/fukawi2/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d01ebf5f43a272d29c6843d9edf79c55')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver/

  sed -i Makefile \
      -e 's|pod2man|/usr/bin/core_perl/pod2man|g' \
      -e 's|D_BIN=/usr/local/sbin|D_BIN=/usr/bin|g'
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/

  make DESTDIR="$pkgdir" PREFIX='/usr' install
}

# vim:set ts=2 sw=2 et:
