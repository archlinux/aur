pkgname=binfmt-java
pkgver=1
pkgrel=1
pkgdesc='register Java runners'
arch=(any)
url='https://wiki.archlinux.org/index.php/Binfmt_misc_for_Java'
license=('FDL1.3')
depends=('java-runtime' 'systemd')
source=('Applet.conf' 'ExecutableJAR.conf' 'Java.conf'
        'jarwrapper' 'javawrapper' 'javaclassname.c')
md5sums=('a9385f6b3eb01b7433fef2741f1ce4c2'
         'f2244ff951ce7318d0d6a94e3fdfa001'
         'c05fb16044abfded174d8a4b17ce7d7c'
         'f5e6a48ef18b92b23a59bc51f60e310f'
         '87f5c8c8dc4705493221be97654f2e13'
         'c6ec75405623591f8c0dead3fa3c3595')
install=$pkgname.install

build (){
  cd "$srcdir"
  gcc $CFLAGS $CPPFLAGS -o javaclassname javaclassname.c
}

package (){
  cd "$srcdir"
  install -d "$pkgdir/usr/lib/binfmt.d" "$pkgdir/usr/local/bin"
  install -m644 'Applet.conf' 'ExecutableJAR.conf' 'Java.conf' "$pkgdir/usr/lib/binfmt.d/"
  install -m755 'jarwrapper' 'javawrapper' 'javaclassname' "$pkgdir/usr/local/bin/"
}
