# Maintainer: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=2.7.1
pkgrel=1
pkgdesc="Complete set of tools that provides a virtual environment for Android."
arch=('i686' 'x86_64')
url="http://www.genymotion.com/"
depends=('ffmpeg-compat' 'gstreamer0.10' 'gstreamer0.10-base' 'libpng' 'net-tools' 'protobuf' 'qca' 'qt5-script' 'qt5-webkit' 'virtualbox')
install=$pkgname.install
license=('custom')
sha512sums=('48e9bafe1d64b688c51eceb8d129f44d690060ff9a6d82eefcf3295f7834516ce62439faf4f4454287f594fc410aafbafd30a43537ea3d295c42bee8e4e03ac7'
            '92286b54b4dfa68b4400ab4c72717c091fe6ea7e9142ef1cfebabe801e682f2a217a443c5990cf2b59f7fa5a4bc22484e8f11b0071766f689363d74d19cbe840')

if [[ $CARCH == x86_64 ]]; then
  _ARCH="x64"
  sha512sums+=('b67997b077e3a632204242d4a716e958d64af0fb28cef27d09ddeffc0a639f6870a64dc4c58aa66a97533c6d726ad9309ce6ebb2ce776b691badaf8f236dcf31')
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
