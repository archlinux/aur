# Maintainer: robertfoster
pkgname=portage-git
pkgver=2.3.100.r3.c238d5f7e
pkgrel=1
pkgdesc="Gentoo's package management system "
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'xmlto' 'rsync' 'eselect-git')
source=('portage::git://anongit.gentoo.org/proj/portage.git')
makedepends=('epydoc' 'git' 'docbook-xsl')
install=$pkgname.install

build() {
    cd portage
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --sbindir=/usr/bin
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	echo ${version#portage.}
}

md5sums=('SKIP')
