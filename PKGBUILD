pkgname=binfmt-java
pkgver=1
pkgrel=2
pkgdesc='register Java runners'
arch=(any)
url='https://wiki.archlinux.org/index.php/Binfmt_misc_for_Java'
license=('FDL1.3')
depends=('java-runtime' 'systemd')
source=('Applet.conf' 'ExecutableJAR.conf' 'Java.conf'
        'jarwrapper' 'javawrapper' 'javaclassname.c')
md5sums=('a9385f6b3eb01b7433fef2741f1ce4c2'
         '626e8d62686221f680f1fd774ef79788'
         'af58337bcbf7894aed44ee156ee5ce67'
         '896eca5b9a01b55d1e2a0f60918f0ebc'
         '72cb3b9942263188c78a659438be69a0'
         'c6ec75405623591f8c0dead3fa3c3595')
install=$pkgname.install

build (){
  cd "$srcdir"
  gcc $CFLAGS $CPPFLAGS -o javaclassname javaclassname.c
}

package (){
  cd "$srcdir"
  install -d "$pkgdir/usr/lib/binfmt.d" "$pkgdir/usr/bin"
  install -m644 'Applet.conf' 'ExecutableJAR.conf' 'Java.conf' "$pkgdir/usr/lib/binfmt.d/"
  install -m755 'jarwrapper' 'javawrapper' 'javaclassname' "$pkgdir/usr/bin/"
}
