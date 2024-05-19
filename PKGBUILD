# Maintainer: Len Share <dranukan at proton dot me>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>

pkgname='openastro.org'
pkgver='1.1.57'
pkgrel=1
pkgdesc='Open source fully-featured astrology software'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.openastro.org/'
depends=('imagemagick' 'python-dateutil' 'python-cairo' 'python-pytz' 'pyswisseph' 'python-gobject')
makedepends=('python-setuptools')
optdepends=()
conflicts=('openastro' 'openastro-dev' 'swisseph_12' 'swisseph_18' 'swisseph-fixstars')
source=(
    "openastro.org_"$pkgver".orig.tar.gz::https://sourceforge.net/projects/openastro-org/files/release/openastro.org_1.1.57.orig.tar.gz/download"
    "openastro.org-data_1.9.orig.tar.gz::https://sourceforge.net/projects/openastro-org/files/release/openastro.org-data_1.9.orig.tar.gz/download"
    "sqlite.patch"
    "swiss.patch"
	)
md5sums=('4bb719ac3a22976d425f6337fd925d32'
         'bf9b6b2ba2ced1a532e16df11447d471'
         'afa8144cc701ab7405b63193c788f820'
         'a6928c4007ae77d4bc137b2427e21cc6')

prepare() {
    cd $srcdir"/openastro.org-"$pkgver
    patch -p0 < ../sqlite.patch
    cd openastromod
    patch -p0 < ../../swiss.patch
}

package() {
    cd $srcdir"/openastro.org-"$pkgver
    python setup.py install --root=$pkgdir || return 1
    cd $srcdir"/openastro.org-data-1.9"
    python setup.py install --root=$pkgdir || return 1
    mkdir -p $pkgdir/usr/share/icons
    cp $srcdir"/openastro.org-"$pkgver/icons/openastro.svg $pkgdir/usr/share/icons
}
