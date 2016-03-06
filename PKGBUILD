# Maintainer: Jens John <dev@2ion.de>
pkgname=mpv-bash-completion-git
pkgver=2
epoch=8
pkgrel=1
pkgdesc="Bash completion for the mpv video player"
arch=('any')
url="https://github.com/2ion/mpv-bash-completion"
license=('GPL')
depends=('mpv' 'bash-completion' 'coreutils' 'bash' 'sed' 'grep')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=mpv-bash-completion.install
source=('git+https://github.com/2ion/mpv-bash-completion.git#branch=master'\
  'mpv-bash-completion.hook'\
  'mpv-bash-completion.install')
sha256sums=('SKIP'\
  '80cf00b0989c1eec582042a45533784c55a7f52fe267bda29ba6691d8ff33c5f'
  '1b966b8cb521cce44fa8cc9c197d5d9b9f3f36481c40ce4003c81edad7de092c')

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "${pkgdir}/etc/bash_completion.d"
  install -Dm755 gen.sh "${pkgdir}/usr/lib/mpv-bash-completion/generate"
  cd "$srcdir"
  install -Dm644 mpv-bash-completion.hook "${pkgdir}/usr/share/libalpm/hooks/mpv-bash-completion.hook"
}
