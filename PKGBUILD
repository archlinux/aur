#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=rodeo
pkgver=1.1.23
pkgrel=1
pkgdesc="A data science IDE for Python"
url=https://www.yhat.com/products/rodeo
arch=(x86_64)
depends=(jupyter)
license=(AGPL3)
install=rodeo.install
md5sums=('' '44c54032370c2a7cbc6667af6d19acf7' 'fcde8ac17c65d3c1bf26f56ee77996a2' 'ce16520cba47175b5fd525148bca9bb7')
PKGEXT=.tar.gz

if [[ $CARCH = i686 ]];then
  _arch=32
  md5sums[0]=''

else
  _arch=64
  md5sums[0]='fc45af6bfce0ed7eb9d52bc55444a6a5'
fi

source=("http://rodeo-releases.s3.amazonaws.com/$pkgver/Rodeo-v$pkgver-linux_$_arch.zip" 'rodeo.install' 'logo.svg' 'rodeo.desktop')

package() {
    install -dm755 "$pkgdir/opt/$pkgname/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -m644 "$srcdir/logo.svg" "$pkgdir/opt/$pkgname/"
    cd "$srcdir/Rodeo-linux-x64"
    install -m644 "${srcdir}/rodeo.desktop" "${pkgdir}/usr/share/applications/"
    mv ./* "$pkgdir/opt/$pkgname/"
    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgname"/Rodeo "$pkgdir/usr/bin/Rodeo"
}
