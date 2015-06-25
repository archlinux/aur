# Contributor: Markus Gross (xsdnyd [at] gmail.com)
# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=udrawgraph
pkgver=3.1.1
pkgrel=4
pkgdesc="The powerful solution for graph visualization"
url="http://www.informatik.uni-bremen.de/uDrawGraph/"
arch=('i686' 'x86_64')
license='CUSTOM'
depends=('libx11')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libx11')
source=("http://www.informatik.uni-bremen.de/uDrawGraph/download/uDrawGraph-$pkgver-0-linux-i386.tar.gz")
md5sums=("7594da0391d2e5a2aa4b073b10938e9a")


package() {
  cd $srcdir/uDrawGraph-3.1

  # just copy all files, it is already binary
  mkdir -p $pkgdir/opt/$pkgname/
  mkdir -p $pkgdir/usr/bin
  cp -r * $pkgdir/opt/$pkgname/

  # put fake binaries in /usr/bin
  echo "#!/bin/bash" > $pkgdir/usr/bin/udrawgraph
  echo "UDG_HOME=/opt/udrawgraph /opt/$pkgname/bin/uDrawGraph "'$@' >> $pkgdir/usr/bin/udrawgraph
  chmod +x $pkgdir/usr/bin/udrawgraph
  
  for i in grapheditor gml2udg formatterm flattenterm checkterm
  do
      echo "#!/bin/bash" > $pkgdir/usr/bin/$i
      echo "UDG_HOME=/opt/udrawgraph /opt/$pkgname/bin/$i "'$@' >> $pkgdir/usr/bin/$i
      chmod +x $pkgdir/usr/bin/$i
  done

  # install license
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
# vim:syntax=sh
