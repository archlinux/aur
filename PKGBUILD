# Maintainer: Alexandr Skurikhin <askurihin@gmail.com>
# Maintainer: Robert Orzanna <orschiro@gmail.com>
# Maintainer: Quan Guo < guotsuan@gmail.com>

pkgname=cheat-git
_gitname=cheat
pkgver=2.4.2
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line"
arch=('any')
license=('GPL3')
url="https://github.com/chrisallenlane/cheat"
depends=('python2' 'python2-docopt')
optdepends=('python2-pygments' 'bash-completion' 'zsh-completions' 'fish')
makedepends=('git' 'python-setuptools')
conflicts=('cheat-bash-git' 'python-cheat')
source=("$pkgname::git+https://github.com/chrisallenlane/cheat.git")
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

package(){
    cd "$pkgname"
    python2 setup.py install --root=$pkgdir --optimize=1
    install -dm755 ${pkgdir}/usr/share/{bash-completion/completions/,zsh/site-functions,fish/completions}
    install -m 644 "${srcdir}/$pkgname/cheat/autocompletion/cheat.bash $pkgdir/usr/share/bash-completion/completions/
    install -m 644 "$srcdir/$_gitname/$_gitname/autocompletion/cheat.zsh" "$pkgdir/usr/share/zsh/site-functions/$_gitname"
	install -m 644 "$srcdir/$_gitname/$_gitname/autocompletion/cheat.fish" "$pkgdir/usr/share/fish/completions/$_gitname"
}

}
