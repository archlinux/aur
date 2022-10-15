# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# former Co-maintainer: Jan Korte <j.korte@me.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=retext-git
pkgver=8.0.0.r1289.fa18e91
pkgrel=1
pkgdesc="A simple editor for Markdown and ReStructuredText markup languages."
arch=('any')
url="https://github.com/retext-project/retext"
license=('GPL3')
depends=('python-pyqt6'
         'python-markups'
         'shared-mime-info'
         'xdg-utils'
         'hicolor-icon-theme' 
	 'desktop-file-utils')
makedepends=('imagemagick' 'git' 'qt5-tools')
optdepends=('python-markdown: for Markdown language support'
            'python-docutils: for reStructuredText language support'
            'python-pyenchant: for spell checking support'
	    'qt6-webengine: for more powerfull preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+${url}.git"
        "retext.desktop"
        "x-retext-markdown.xml"
        "x-retext-rst.xml")
sha256sums=('SKIP'
            'a784275c951b330c2fc2ac2f5ac82b457ca09d37a0cf6e9e27e1e5716084d118'
            'b51611479d3224eec2b58264ed91ace3eccb502b7b806dae3e7a3ab4aab8c4b8'
            '6fef80cccb14813d9cc74810c397a6cd7831d1ca243536759a47c6e8b6cc977a')

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" "$(awk -F\= '/^VERSION/ {print $2}' setup.py | tr -d \' | tr -d [:blank:])" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd $pkgname/ReText/locale
  lrelease *.ts
}

package () {
  cd $pkgname/
  python setup.py install --root="$pkgdir"
}

