# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# From pear-auth-sasl2
# Contributor: jsteel <mail at jsteel dot org>

set -u
_perlmod='PackageFileManager2'
_modnamespace='PEAR'
_pkgnameu="${_modnamespace}_${_perlmod}"
_pkgname="${_pkgnameu,,}"
_pkgname="${_pkgname//_/-}"
pkgname="pear-${_pkgname}"
pkgver='1.0.4'
pkgrel='1'
pkgdesc='takes an existing v2 package.xml file and updates it with a new filelist and changelog'
arch=('any')
url="http://pear.php.net/package/${_pkgnameu}"
license=('PHP')
makedepends=('php-pear')
source=("http://download.pear.php.net/package/${_pkgnameu}-${pkgver}.tgz")
noextract=("${_pkgnameu}-${pkgver}.tgz")
md5sums=('44c6efe61fc3465641d98591d57c60a3')
sha256sums=('44731f87677e476821c04313e8c1ffd41d330ce33ebce99112ded919af029601')

package() {
  set -u
  if ! pear install -R "${pkgdir}" -O -n -s "${srcdir}/${_pkgnameu}-${pkgver}.tgz"; then
    echo "A .lock file error indicates that ${_pkgnameu} was installed by pear, not pacman. Try: sudo pear uninstall ${_pkgnameu}"
    set +u
    false
  fi

  shopt -s nullglob
  rm -r "${pkgdir}"/.[a-z]* "${pkgdir}/tmp"
  shopt -u nullglob
  set +u
}
set +u
