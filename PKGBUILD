# Maintainer: DenBrahe <denbrahe at hotmail dot com>

_major_version=1.1
_minor_version=1

pkgname=idp-ide
pkgver=${_major_version}.${_minor_version}
pkgrel=3
pkgdesc="IDP Knowledge Base System editor"
arch=('i686' 'x86_64')
url="http://dtai.cs.kuleuven.be/software/idp"
license=('LGPL3')
depends=('idp')

_dirname="idp-ide-${_major_version}.${_minor_version}-Linux"

source=("https://downloads.sourceforge.net/project/idp/idp-ide/$_dirname.tar.gz")

md5sums=('cba00affb753128d613099c1a93b074c')

package() {
  cd "${srcdir}"
  rm "$_dirname.tar.gz"

  # put files in /usr/share/idp-ide
  targetDir="${pkgdir}/usr/share/idp-ide"
  mkdir -p "${targetDir}"
  cp -dR ./* "${targetDir}/"
  sed -r -i -e 's,/usr/bin/idp,/usr/local/bin/idp,g' "${targetDir}/webID.cfg"

  # create executable (with fix for log files)
  mkdir -p "${pkgdir}/usr/bin"
  echo "sh -c 'mkdir -p $XDG_CACHE_HOME/idp-ide/log && cd $XDG_CACHE_HOME/idp-ide && /usr/share/idp-ide/webID'" >"${pkgdir}/usr/bin/idp-ide"
  chmod +x "${pkgdir}/usr/bin/idp-ide"
}
