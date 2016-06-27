# Maintainer: Jens John <dev@2ion.de>
pkgname=mpv-bash-completion-git
pkgver=3
epoch=8
pkgrel=1
pkgdesc="Bash completion for the mpv video player"
arch=('any')
url="https://github.com/2ion/mpv-bash-completion"
license=('GPL')
depends=('mpv' 'bash' 'lua')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=mpv-bash-completion.install
source=('git+https://github.com/2ion/mpv-bash-completion.git#branch=master'\
  'mpv-bash-completion.hook'\
  'mpv-bash-completion.install')
sha256sums=('SKIP'\
  '47e79efd255f67b29da87262fc353abefa209044ac8224245dce998269a1635b'
  '1b966b8cb521cce44fa8cc9c197d5d9b9f3f36481c40ce4003c81edad7de092c')

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "${pkgdir}/etc/bash_completion.d"
  install -Dm755 gen.lua "${pkgdir}/usr/lib/mpv-bash-completion/generate"
  cd "$srcdir"
  install -Dm644 mpv-bash-completion.hook "${pkgdir}/usr/share/libalpm/hooks/mpv-bash-completion.hook"
}
