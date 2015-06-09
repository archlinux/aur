# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>
# Contributor: skydrome <irc.freenode.net>

_pkgname=enki-editor
pkgname=$_pkgname-git
pkgver=15.05.0.r3.g7a1eefa
pkgrel=1
pkgdesc="Text editor for programmers. Live preview in Markdown, reStructuredText and HTML"
arch=('any')
url="http://enki-editor.org/"
license=('GPL')
depends=('python2-pyparsing' 
         'qutepart-git')
#            'python2-pygments: Scheme preview'
optdepends=('ctags: navigation in file'
            'python2-code-chat: source code to HTML translation (literate programming)'
            'python2-docutils: reStructuredText preview'
            'python2-markdown: Markdown preview'
            'tre: preview synchronization')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::git://github.com/hlamer/enki.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's/env python/env python2/' setup.py
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

