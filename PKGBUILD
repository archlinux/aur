# Maintainer: Jiuyang Liu <liu@jiuyang.me>

pkgname=gitmirror
pkgver=1.0.0
pkgrel=1
pkgdesc='Auto sync GitHub to GitLab'
arch=('any')
url='https://github.com/sequencer/gitmirror'
license=('BSD')
depends=('java-environment')
makedepends=('mill')
source=("https://github.com/sequencer/gitmirror/archive/$pkgver.tar.gz")

build(){
  cd gitmirror-$pkgver
  mill gitmirror.assembly
}

package() {
  cd gitmirror-$pkgver
  install -Dm755 out/gitmirror/assembly/dest/out.jar "$pkgdir"/usr/bin/gitmirror
  install -Dm600 config.json $pkgdir/etc/$pkgname/config.json
  install -Dm755 gitmirror.service $pkgdir/usr/lib/systemd/system/gitmirror.service
  install -Dm755 gitmirror.timer $pkgdir/usr/lib/systemd/system/gitmirror.timer
}
md5sums=('5d41c909362b4f911077894d4b057dd5')
