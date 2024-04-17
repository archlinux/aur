# Maintainer: Raffaele Mancuso <raffaelemancuso532@gmail.com>
_pkgroot=pdf_extbook
pkgname="${_pkgroot}-git"
pkgver=r5.f0de5fa
pkgrel=1
pkgdesc="Extract bookmarked PDF pages."
arch=('any')
url="https://github.com/raffaem/pdf_extbook"
license=('MIT')
depends=('python3' 'fzf' 'pdftk')
optdepends=('qpdf: alternative page extraction engine'
            'pdfjam: alternative page extraction engine')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgroot}")
source=("${_pkgroot}_src::git+https://github.com/raffaem/pdf_extbook")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgroot}_src"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgroot}_src"
  install -Dm755 pdf_extbook "${pkgdir}/usr/bin/pdf_extbook"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pdf_extbook-git/LICENSE"
}
