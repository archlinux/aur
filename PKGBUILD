# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=rss2email-git
pkgver=latest
pkgrel=4
pkgdesc="A tool for delivering news from RSS feeds to your email program (development version)"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/rss2email"
license=("GPL")
depends=("python" "python-html2text" "python-feedparser")
provides=('rss2email')
conflicts=('rss2email' 'rss2email-wking')
makedepends=('git')
source=("git+https://github.com/rss2email/rss2email.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/rss2email
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

package() {
  cd "${srcdir}"/rss2email
  python setup.py install \
      --prefix=/usr \
      --root="${pkgdir}"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -D -m644 ./README.rst "${pkgdir}"/usr/share/rss2email/README.rst
  install -m644 ./CHANGELOG "${pkgdir}"/usr/share/rss2email
  install -D -m644 ./r2e.1 "${pkgdir}"/usr/share/man/man1/r2e.1
}
