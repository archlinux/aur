# Maintainer: Daniel Buch Hansen (dbuch) <boogiewasthere@gmail.com>

pkgname=dbuch-zsh-config
pkgver=1
pkgrel=2
pkgdesc="dbuch zsh configuration"
url="https://github.com/dbuch/"
arch=(x86_64)
license=(GPL)
depends=('zsh>=5.3' 'exa' 'bat' 'skim')
makedepends=(git)
source=("git+https://github.com/dbuch/dbuch-zsh-config.git")
conflicts=('grml-zsh-config')
sha256sums=('SKIP')

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
