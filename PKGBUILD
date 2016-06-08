# Maintainer: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=2.7.0
pkgrel=1
pkgdesc="Complete set of tools that provides a virtual environment for Android."
arch=('i686' 'x86_64')
url="http://www.genymotion.com/"
depends=('ffmpeg-compat' 'gstreamer0.10' 'gstreamer0.10-base' 'libpng' 'net-tools' 'protobuf' 'qca' 'qt5-script' 'qt5-webkit' 'virtualbox')
install=$pkgname.install
sha512sums=('48e9bafe1d64b688c51eceb8d129f44d690060ff9a6d82eefcf3295f7834516ce62439faf4f4454287f594fc410aafbafd30a43537ea3d295c42bee8e4e03ac7'
            '92286b54b4dfa68b4400ab4c72717c091fe6ea7e9142ef1cfebabe801e682f2a217a443c5990cf2b59f7fa5a4bc22484e8f11b0071766f689363d74d19cbe840'
            '7b837062571e949a44e59fb3df716069b6651fcfbd26494ca9b24c89bdca3cb5c0d0f62b043019facc2ebe2ead5ecb243a1137bf8810e622908cd506a0a2f3c0')

if [[ $CARCH == x86_64 ]]; then
  _ARCH="x64"
  sha512sums+=('455b9e6cdb1752b0390638d7b2856ea83248d9a9e5018760a4b9d9103d01956b4f1dc0fe5769579893ffe832a659117c7f0bcfba88120b9822e613ddc4d9e42f')
else
  _ARCH="x86"
  sha512sums+=('637df7cd843044c1d3be1abc30a248d78649a57b65fb5386add937b0f4ee52e76a9e3f3184aa8d47969235f8a6861f315edb0cb45bdc83035f1f26ecb0491f8b')
fi

source=("genymotion.desktop"
        "genymotion-player.desktop"
        "http://files2.genymotion.com/genymotion/genymotion-$pkgver/$pkgname-${pkgver}-linux_$_ARCH.bin")

package(){
  cd $srcdir

  install -d $pkgdir/opt
  yes | bash ./$pkgname-${pkgver}-linux_$_ARCH.bin -d $pkgdir/opt

  install -d $pkgdir/usr/bin
  ln -s /opt/genymotion/genymotion $pkgdir/usr/bin/genymotion
  ln -s /opt/genymotion/genymotion-shell $pkgdir/usr/bin/genymotion-shell
  ln -s /opt/genymotion/player $pkgdir/usr/bin/genymotion-player
  ln -s /opt/genymotion/gmtool $pkgdir/usr/bin/gmtool
  install -Dm644 $srcdir/genymotion.desktop $pkgdir/usr/share/applications/genymotion.desktop
  install -Dm644 $srcdir/genymotion-player.desktop $pkgdir/usr/share/applications/genymotion-player.desktop
  chown -R root:root $pkgdir/opt/genymotion
}
