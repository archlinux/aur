# Contributer: Philipp Geyer <nistur@gmail.com>
# Mantainer: gryffyn <aur (at) micah (dot) mp>

pkgname=crark
pkgver=5.5
download=crark55-linux.rar
pkgrel=1
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors. with CUDA support"
arch=('x86_64')
url="http://www.crark.net/"
license=("unknown")
options=('!strip')
optdepends=('cuda' 'opencl')
makedepends=('unrar')
provides=('crark')
source=("http://www.crark.net/download/${download}"
        "crark"
        "crark-ocl")
md5sums=('a906db19b88baf63042abaa3847b77f1'
         'f471d3db1066f47d1ed23a73d7ac7221'
         'f44d74487e4a1ee973a292e70720468f')
noextract=(${download})

build() {
  cd ${srcdir}
  rm -rf "${pkgname}-${pkgver}"
  mkdir -p "${pkgname}-${pkgver}"
  unrar x -xcrackme ${download} ${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  chmod +r ${pkgdir}/opt/${pkgname}/{spanish,english,russian}.def 
  mv ${pkgdir}/opt/${pkgname}/english.def ${pkgdir}/opt/${pkgname}/password.def
  install ${pkgname} -m644  $pkgdir/usr/bin

  cd ${srcdir}
  install ${pkgname} -m644 $pkgdir/usr/bin
  install ${pkgname}-ocl -m644 $pkgdir/usr/bin
  chmod +x ${pkgdir}/usr/bin/${pkgname}{,-ocl}
# ln -s "/opt/${pkgname}/crark" "$pkgdir/usr/bin/crark-cuda"
# export PATH=/opt/crark-cuda:$PATH

}  
