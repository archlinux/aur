# Maintainer: robertfoster
pkgname=portage-git
pkgver=3.0.19.r9.b18d15009
pkgrel=1
pkgdesc="Gentoo's package management system "
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'xmlto' 'rsync' 'eselect-git')
source=("${pkgname%-git}::git://anongit.gentoo.org/proj/portage.git")
makedepends=('epydoc' 'git' 'docbook-xsl')
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py install --root="${pkgdir}" --sbindir=/usr/bin
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  version="$(
    git describe --long --match 'portage-*' | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
  )"
  echo "${version#portage.}"
}

md5sums=('SKIP')
