# Maintainer: Matthew Hague <matthewhague at zoho dot com>

pkgname=perl-extract-url-git
pkgver=1.6.2.r0.gc38d2c9
pkgrel=3
pkgdesc='Alternative or preprocessor for urlview, primarily for use with mutt'
arch=(any)
url='http://www.memoryhole.net/~kyle/extract_url'
replaces=(extracturl-git)
conflicts=(extracturl-git perl-extract-url)
provides=(perl-extract-url)
license=('BSD-2-Clause (simplified)')
depends=('perl'
         'perl-mime-tools'
         'perl-html-parser')
optdepends=('perl-curses-ui: allows it to fully replace urlview'
            'perl-uri-find: for recognising more exotic urls')
source=(git+https://github.com/m3m0ryh0l3/extracturl.git)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/extracturl
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/extracturl
  make
  make  DESTDIR=$pkgdir install 
}
