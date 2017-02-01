# Maintainer: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
_prodname=mssql-tools
pkgname=${_prodname}-ubuntu
pkgver=14.0.2.0
_prodver=${pkgver}-1
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux tools"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools"
license=('unknown')
depends=('msodbcsql-ubuntu' 'libcurl-compat')
source=("https://packages.microsoft.com/ubuntu/16.04/prod/pool/main/m/${_prodname}/${_prodname}_${_prodver}_amd64.deb" "sqlcmd.sh")
md5sums=('a162f3fe647356cf2a20079a4a15b4b4'
         '8cb0c1a4aef59cee1d046d1d14bf577c')
noextract=("${_prodname}_${_prodver}_amd64.deb" "sqlcmd.sh")

package() {
  cd ${pkgdir}
  ar x ${srcdir}/${_prodname}_${_prodver}_amd64.deb
  tar xfJ data.tar.xz
  rm ${pkgdir}/control.tar.gz
  rm ${pkgdir}/data.tar.xz
  rm ${pkgdir}/debian-binary
  rm ${pkgdir}/_gpgorigin  
  #rm $pkgdir/usr/bin/sqlcmd
  mkdir ${pkgdir}/usr/bin
  cp ${srcdir}/sqlcmd.sh ${pkgdir}/usr/bin/sqlcmd
  #sed "s/version/${pkgver}/" -i ${pkgdir}/usr/bin/sqlcmd 
  sed "s/version/13.0.1.0/" -i ${pkgdir}/usr/bin/sqlcmd #executable version does not match product version
  chmod 775 ${pkgdir}/opt
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/bin
  chmod 755 ${pkgdir}/usr/share
  chmod 755 ${pkgdir}/usr/share/doc
}
