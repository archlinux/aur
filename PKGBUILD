# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=weblogo2
pkgver=2.8.2
pkgrel=1
pkgdesc="A web based application designed to make the generation of sequence logos as easy and painless as possible"
url="http://weblogo.berkeley.edu//"
arch=('i686' 'x86_64')
license=('custom (MIT)')
depends=('ghostscript' 'perl')
source=("http://weblogo.berkeley.edu/release/weblogo.2.8.2.tar.gz")
md5sums=('12886e0f41757e32ac2823d0f990ce0c')

prepare(){
# patch to allow perl to resolve through the link we're going to make
sed -i 's,$Bin,$RealBin,g' ${srcdir}/weblogo/seqlogo
}

package() {
# put the src into opt
mkdir -p "${pkgdir}/opt/${pkgname}"
cp -a ${srcdir}/weblogo/* "${pkgdir}/opt/${pkgname}/."

# link the exe
mkdir -p ${pkgdir}/usr/bin
ln -s /opt/${pkgname}/seqlogo ${pkgdir}/usr/bin/.

# install license file
install -m644 -D "${srcdir}/weblogo/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:#

