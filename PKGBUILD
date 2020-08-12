# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

_pkgname=git-fuzzy
pkgname=$_pkgname-git
pkgver=0.r27
pkgrel=3
pkgdesc="interactive git with the help of fzf"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('fzf')
optdepents=('git-delta-git: improved diff highlighting'
            'diff-so-fancy: improved diff highlighting'
            'bat: syntax highlighting'
            'exa: ')
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
  sed -i 's%lib_dir="$script_dir/../lib"%lib_dir=/usr/lib/git-fuzzy%' bin/git-fuzzy
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 bin/git-fuzzy -t "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"
  cp -r lib "${pkgdir}/usr/lib/git-fuzzy"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
