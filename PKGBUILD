#Maintainer: James An <james@jamesan.ca>

pkgname=pear-channel-pear2
pkgver=1
pkgrel=1
pkgdesc='PEAR2 PEAR channel'
arch=('any')
url="http://pear2.php.net/"
license=('MIT')
depends=('php-pear')
options=('!strip')
source=(http://pear2.php.net/channel.xml)
md5sums=('087a7d8bf8522cfcbfbb3019e2b01ddf')

package() {
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} channel-add channel.xml
  rm ${_PEARDIR}/{.depdb*,.filemap,.lock}
  rm -r ${_PEARDIR}/.channels/{__uri.reg,{doc,pecl,pear}.php.net*}
  rm ${_PEARDIR}/.channels/.alias/{phpdocs,pecl,pear}.txt
  rm -r ${_PEARDIR}/.registry/{.channel.__uri,.channel.{doc,pecl}.php.net}
}

