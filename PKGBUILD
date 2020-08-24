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
source=("https+git://github.com/sequencer/gitmirror")

build(){
  cd gitmirror
  mill gitmirror.assembly
}

package() {
  cd gitmirror
  install -Dm755 out/gitmirror/assembly/dest/out.jar "$pkgdir"/usr/bin/gitmirror
  install -Dm600 config.json $pkgdir/etc/$pkgname/config.json
  install -Dm755 gitmirror.service $pkgdir/usr/lib/systemd/system/gitmirror.service
  install -Dm755 gitmirror.timer $pkgdir/usr/lib/systemd/system/gitmirror.timer
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
