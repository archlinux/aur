# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server-noopts
pkgver=1.32.0_310
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
depends=(net-tools bash)
conflicts=(code-server)
replaces=(code-server)
_ghtag=${pkgver//_/-}
_dirname=code-server-${_ghtag}-linux-x64
_nexe=usr/bin/code-server.nexe
source=(https://github.com/codercom/code-server/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=(SKIP)
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  (
    echo '#! /usr/bin/bash'
    echo 'unset NODE_OPTIONS'
    echo exec "'$pkgdir'"/$_nexe '$@'
  ) > launch.sh

  install -Dm755 launch.sh "$pkgdir"/usr/bin/code-server
  install -Dm755 code-server "$pkgdir"/$_nexe
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
