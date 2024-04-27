# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

_pkgname=git-fuzzy
pkgname=$_pkgname-git
pkgver=0.r90
pkgrel=1
pkgdesc="interactive git with the help of fzf"
license=('MIT')
arch=('any')
depends=('bc' 'git' 'fzf')
optdepends=('hub: alternative git client'
            'git-delta: improved diff highlighting'
            'diff-so-fancy: improved diff highlighting'
            'bat: syntax highlighting'
            'exa')
conflicts=("${_pkgname}")
url="https://github.com/bigH/git-fuzzy"
source=("git+https://github.com/bigH/git-fuzzy.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "0.r%s" $(git rev-list --count HEAD)
  # git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's%git_fuzzy_dir=.*%git_fuzzy_dir=/usr/lib/git-fuzzy%' bin/git-fuzzy

  sed -i 's%gifs/%https://github.com/bigH/git-fuzzy/raw/master/gifs/%' README.md
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 bin/git-fuzzy -t "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/git-fuzzy"
  cp -r lib "${pkgdir}/usr/lib/git-fuzzy"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
