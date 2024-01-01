# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

# TODO: Move out of /opt
# TODO: Implement DKMS
# TODO: Provide simple test instructions

set -u
pkgname='knem'
#pkgver='1.1.2'; _relno='34521'
#pkgver='1.1.3'; _relno='37186'
pkgver='1.1.4'
pkgrel='1'
pkgdesc='High-Performance Intra-Node MPI Communication'
arch=('any')
#url='http://knem.gforge.inria.fr'
url='https://knem.gitlabpages.inria.fr/'
license=('BSD')
depends=('hwloc')
makedepends=('make')
install='knem.install'
#_verwatch=("${url}/download/" "http://gforge.inria.fr/frs/download.php/[0-9]\+/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
_srcdir="${pkgname}-${pkgname}-${pkgver}"
source=(
  #"http://runtime.bordeaux.inria.fr/knem/download/knem-${pkgver}.tar.gz"
  #"http://gforge.inria.fr/frs/download.php/${_relno}/knem-${pkgver}.tar.gz"
  "https://gitlab.inria.fr/knem/knem/-/archive/knem-${pkgver}/knem-knem-${pkgver}.tar.gz"
  #"0000-gentoo-knem-1.1.3-setup_timer.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-cluster/knem/files/knem-1.1.3-setup_timer.patch?id=768341030da4acb06798dc0d444ba8ca9dfea5f8"
)
md5sums=('17aa29f62ab9f612c8f4f5e851c10067')
sha256sums=('2196777458626c467057dd7eaee915154acda47dcd0600edb271ef7535198e7b')

prepare() {
  set -u
  cd "${_srcdir}"
  #patch -Nup1 -i "${srcdir}/0000-gentoo-knem-1.1.3-setup_timer.patch"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  [ -s 'configure' ] || ./autogen.sh
  [ -s 'Makefile' ] || ./configure --prefix='/opt/knem'
  #[ -s 'Makefile' ] || ./configure --prefix='/usr' --sbindir='/usr/bin' --sysconfdir='/etc'
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 install DESTDIR="${pkgdir}"
  set +u
}
set +u
