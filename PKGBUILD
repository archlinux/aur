# Maintainer: Karmanyaah Malhotra <karmanyaahm at gmail dot com>
# Contributor: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver=1.1.4
pkgrel=1
epoch=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
provides=('hyperspace')
conflicts=('hyperspace')
license=('custom:NPLv4')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils libappindicator-gtk3 libsecret)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver//_/-}/hyperspace_${pkgver//_/-}_amd64.deb"
        'LICENSE.txt')
sha256sums=('4c290c7b8bb1816592cde9897ec6f12981c1daf51abe1235db8f2de4272c0fef'
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
