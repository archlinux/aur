# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver=1.1.1
pkgrel=1
epoch=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=('custom:NPLv4')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils libappindicator-gtk3 libsecret)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver//_/-}/hyperspace_${pkgver//_/-}_amd64.deb"
        'LICENSE.txt')
sha256sums=('478044ab47a3f7f5de7f901d537ce21fed41a00031b5bafc260014d9363980ac'
            'f49ae3685bf4635b0eb6f07fe684ed1b30f5b2a2c9b5b05b589fb9edfead8d35')

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cp -R opt/ usr/ $pkgdir
  mkdir $pkgdir/usr/bin
  ln -s "/opt/Hyperspace Desktop/hyperspace" $pkgdir/usr/bin/hyperspace
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
