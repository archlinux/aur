#Maintainer: James An <james@jamesan.ca>

_pkgname=phpseclib
pkgname=pear-$_pkgname
pkgver=0.3.10
pkgrel=1
pkgdesc='PHP Secure Communications Library'
arch=('any')
url="http://phpseclib.sourceforge.net/"
license=('MIT')
depends=('pear-channel-phpseclib')
options=('!strip' '!emptydirs')
source=(
  "http://phpseclib.sourceforge.net/get/"{Crypt_{AES,Base,Blowfish,DES,Hash,RC4,RSA,Random,Rijndael,TripleDES,Twofish},File_{ANSI,ASN1,X509},Math_BigInteger,Net_S{FTP,SH{1,2}},System_SSH_Agent}"-$pkgver.tgz"
)
noextract=("${source[@]##*/}")
md5sums=('4caef4e8b8430c80cd973fe6d9ee102a'
         '92db496c965eee3c998f49b77e07a85a'
         'dc404ed7c64f517964dc8b0a8d7bc803'
         'a937b1eb9869b0c2b463de4fb7dd3dcd'
         'e130a2c7758a569c67dee9a83cc9db47'
         '7840578e0982d1c39ae01fa960ada43d'
         '9e0575e2026bed43debcf52d8754f951'
         'a610c0f9d96a752297d0ade8daaa9c51'
         'd1fbb6694291c6ae42e502f90adc4c83'
         'e0aa5f2345e48d0545966576ce54f5a7'
         'd0bda288e70425b20dbcc78bf92c92df'
         '0024c45f1acdae0416470426fb2862bb'
         '61ec46f1c91284a7256c32c512a54221'
         '8958c7d99d75209404ce3ebddfb21b3a'
         'a8fc061c2fc35a0bdfe5eefcf23d64e2'
         '0fca306f2d99e823f44856186bb089b3'
         '6494d6e84f455fcaff5a529dad287380'
         '3dc93930ea419374ae9f1dd7319a744f'
         'f003c2efa9fd32674a02e4e97ccb9f02')

package() {
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} channel-discover phpseclib.sourceforge.net
  for package in "${source[@]##*/}"; do
    pear ${_PEAROPTS} install -O -n $package
  done
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock}
}
