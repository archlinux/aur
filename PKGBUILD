# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Co-Maintainer: Matthias Bodenbinder <matthias@bodenbinder.de>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#
# getmail6 is a mail retriever with support for POP3, POP3-over-SSL, IMAP4,
# IMAP4-over-SSL, and SDPS mail accounts. It is a fork of getmail 5.14 with
# adaptations to work with Python 3 and newer.

pkgname='getmail6'
pkgdesc="mail retriever with support for POP3, IMAP4, SDPS; fork of getmail 5.14 modified to support python3"
pkgver=6.21.01
pkgrel=1
arch=('any')
url='http://getmail6.org/'
license=('GPL-2.0-only')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-keyring: secure password store'
            'python-keyrings-alt: alternative backends')
source=("${pkgname}-${pkgver}.tgz::https://github.com/getmail6/getmail6/archive/v${pkgver}.tar.gz")
sha512sums=('941588197fea4fecb6812a5c77796abe2ba345b098c6c97cf0d00bb1db19600e66c9bda4b59cce1acabaec481f9ec1c3016afaf298dd1d9e9b831cc998acc254')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 docs/COPYING
}
