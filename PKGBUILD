# Maintainer: FzerorubigD <fzerorubigd {AT} GMail {DOT} com>
pkgname=tmass-git
pkgver=33.9c633d7
pkgrel=1
pkgdesc="A simple session manager for tmux."
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/fzerorubigd/tmass"
license=('GPL3')
depends=()
makedepends=('go' 'git')
source=('git://github.com/fzerorubigd/tmass.git')

sha1sums=('SKIP')

_gitname=tmass

pkgver() {
        cd "${srcdir}/${_gitname}"
        echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p ${srcdir}/src/github.com/fzerorubigd/tmass
        cd "${srcdir}/${_gitname}"
	git --work-tree=${srcdir}/src/github.com/fzerorubigd/tmass checkout -f master
	cd ${srcdir}/src/github.com/fzerorubigd/tmass
	GOPATH=${srcdir} go get -v
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/tmass $pkgdir/usr/bin/tmass
  install -Dm644 ${srcdir}/src/github.com/fzerorubigd/tmass/tools/bash_tmass ${pkgdir}/usr/share/bash-completion/completions/tmass
  install -Dm644 ${srcdir}/src/github.com/fzerorubigd/tmass/tools/zsh_tmass ${pkgdir}/usr/share/zsh/site-functions/_tmass
}
