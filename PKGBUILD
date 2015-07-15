#Maintainer: James An <james@jamesan.ca>

pkgname=pear-channel-phpseclib
pkgver=1
pkgrel=1
pkgdesc='PHP Secure Communications Library PEAR channel'
arch=('any')
url="http://phpseclib.sourceforge.net/"
license=('MIT')
depends=('php-pear')
options=('!strip')
source=(http://phpseclib.sourceforge.net/channel.xml)
md5sums=('f10b822379303e0b2ebd4072ae2ea7e6')

package() {
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} channel-add channel.xml
  rm ${_PEARDIR}/{.depdb*,.filemap,.lock}
  rm -r ${_PEARDIR}/.channels/{__uri.reg,*.php.net*}
  rm ${_PEARDIR}/.channels/.alias/{pear.txt,pecl.txt,phpdocs.txt}
  rm -r ${_PEARDIR}/.registry/{.channel.__uri,.channel.*.php.net}
}

