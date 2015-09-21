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
pkgver='1.0.2'
pkgrel='1'
pkgdesc='takes an existing v2 package.xml file and updates it with a new filelist and changelog'
arch=('any')
url="http://pear.php.net/package/${_pkgnameu}"
license=('PHP')
makedepends=('php-pear')
source=("http://download.pear.php.net/package/${_pkgnameu}-${pkgver}.tgz")
noextract=("${_pkgnameu}-${pkgver}.tgz")
sha256sums=('188a2adfef7d93e20002c9909ebe2372af6380466a926b57e83c1221f9da4ee6')

package() {
  set -u
  if ! pear install -R "${pkgdir}" -O -n -s "${srcdir}/${_pkgnameu}-${pkgver}.tgz"; then
    echo "A .lock file error indicates that ${_pkgnameu} was installed by pear, not pacman. Try: sudo pear uninstall ${_pkgnameu}"
    set +u
    false
  fi

  rm -r "${pkgdir}/usr/share/pear"/{.channels,.depdb*,.filemap,.lock} "${pkgdir}/tmp"
  set +u
}
set +u
