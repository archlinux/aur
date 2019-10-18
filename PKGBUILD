# Maintainer: Daniel Buch Hansen (dbuch) <boogiewasthere@gmail.com>

pkgname=dbuch-zsh-config
pkgver=0.1.0
pkgrel=1
pkgdesc="dbuch zsh configuration"
url="https://github.com/dbuch/"
arch=(x86_64)
license=(GPL)
depends=('zsh>=5.3' 'ripgrep' 'bat' 'skim')
makedepends=(git)
_commit=87800ba4c17fcc849283ddf9e708f8e2432c6520 #tags/v0.1.0
source=("git+https://github.com/dbuch/dbuch-zsh-config.git#commit=$_commit")
conflicts=('grml-zsh-config')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init

  git config --local submodule.subprojects/zsh-async.url "$srcdir/zsh-async"

  git submodule update
}

package() {
	cd ${srcdir}/${pkgname}

	install -D -m644 zshrc.skel \
    ${pkgdir}/etc/skel/zshrc

	install -D -m644 zshrc \
    ${pkgdir}/etc/zsh/zshrc

	install -D -m644 zsh-async/async.zsh \
    ${pkgdir}/usr/share/zsh/functions/Async/async

  install -D -m644 dbuch-prompt.zsh \
    ${pkgdir}/usr/share/zsh/functions/Prompts/prompt_dbuch_setup
}

# vim:set sw=2 et:
