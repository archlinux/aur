# Contributor: Jamie Beardslee, Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Mingde (Matthew) Zeng <matthewzmd@posteo.net>

pkgname=emacs-application-framework-git
pkgver=r2509.962a3b98
pkgrel=1
pkgdesc="A free/libre and open-source extensible framework that revolutionizes the graphical capabilities of Emacs, the key to ultimately Live in Emacs"
arch=('any')
url="https://github.com/emacs-eaf/emacs-application-framework"
license=('GPL3')
makedepends=('git' 'nodejs' 'npm')
depends=('python')
provides=('emacs-eaf')
conflicts=('emacs-eaf')
source=("git+https://github.com/emacs-eaf/emacs-application-framework")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/eaf/
  for _i in LICENSE core *.el *.py *.json *.md
  do
    cp -r ${_i} "$pkgdir"/usr/share/emacs/site-lisp/eaf/
  done
  install -Dm644 README.md "$pkgdir"/usr/share/doc/emacs-application-framework-git/README.md
  install -Dm644 README.zh-CN.md "$pkgdir"/usr/share/doc/emacs-application-framework-git/README.zh-CN.md

  cd "$pkgdir"/usr/share/emacs/site-lisp/eaf && python ./install-eaf.py

  echo "Installation complete, please add $pkgdir/usr/share/emacs/site-lisp/eaf/ to your load-path."
}
