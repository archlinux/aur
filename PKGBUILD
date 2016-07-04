# Maintainer: ArthurBorsboom <arthurborsboom@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
pkgname=spark
pkgver=2.7.7
pkgrel=0
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('i686' 'x86_64')
url="http://www.igniterealtime.org/projects/spark/"
license=('LGPL')
if [[ $CARCH == x86_64 ]]; then
        depends=('java-runtime' 'unixodbc' 'lib32-libxtst')
fi
if [[ $CARCH == i686 ]]; then
        depends=('java-runtime' 'unixodbc' 'libxtst')
fi
options=('!strip')
source=(http://download.igniterealtime.org/${pkgname}/${pkgname}_${pkgver//./_}.tar.gz)
md5sums=('01106c35cb11807f93b0ae8d10e8dd44')

conflicts=('spark-svn')

package() {
    cd "$srcdir"
	sed -i 's/\\lib\\windows/lib\/linux/g' Spark/Spark

    install -d -m755 "${pkgdir}"/opt/spark
    cp -R Spark/. $pkgdir/opt/spark
    
    install -d -m755 "${pkgdir}"/usr/bin
    ln -fs /opt/spark/Spark $pkgdir/usr/bin/spark
}
