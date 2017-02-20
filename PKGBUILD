#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=electronic-wechat-bin
pkgver=2.0
pkgrel=1
pkgdesc="A better WeChat on macOS and Linux. Built with Electron by Zhongyi Tong."
url=https://github.com/geeeeeeeeek/electronic-wechat
arch=(i686 x86_64)
replaces=('electronic-wechat' 'electronic-wechat-git')
conflicts=('electronic-wechat' 'electronic-wechat-git')
depends=('gconf')
license=(MIT)


md5sums=('3e2ebd0c2d5ba52923168fab54b05c14'
         '5067d2ecdfa58d16affc950102cd36bd'
         'ffc9bdbcce89519b59f78d4bb50ea315')

if [[ $CARCH = i686 ]];then
  md5sums[0]='8556d6228b4bad238c63003e44c626cf'
  _arch=ia32
else
  _arch=x64
fi
source=("https://github.com/geeeeeeeeek/electronic-wechat/releases/download/V$pkgver/linux-$_arch.tar.gz"
"https://github.com/geeeeeeeeek/electronic-wechat/raw/master/assets/icon.png"
"electronic-wechat.desktop")


package() {
    mkdir -p "${pkgdir}/opt/$pkgname"
    cp icon.png "${pkgdir}/opt/$pkgname/"

    install -dm755 "$pkgdir"/usr/share/applications
    cp electronic-wechat.desktop "$pkgdir"/usr/share/applications

    cd electronic-wechat-linux-$_arch
    install -dm755 "$pkgdir/opt/$pkgname/"
    mv * "$pkgdir/opt/$pkgname/"

    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgname"/electronic-wechat "$pkgdir/usr/bin/electronic-wechat"

}
