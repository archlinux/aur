# Maintainer: Vitor Hideyoshi <vitor.h.n.batista@gmail.com>

pkgname=gitflow-git
_gitname=gitflow
_branch_name=master
pkgver=0.4.1.git.297.1ffb6b1
pkgrel=1
pkgdesc="Git extensions to provide high-level repository operations for Vincent Driessen's branching model."
conflicts=('gitflow' 'gitflow-avh' 'gitflow-avh-git')
arch=('any')
url="https://github.com/nvie/gitflow"
license=('LGPL')
depends=('git')
source=("${_gitname}::git+${url}.git#branch=${_branch_name}"
        "git+https://github.com/nvie/shFlags.git")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "${srcdir}/${_gitname}"
  source ./git-flow-version
  echo ${GITFLOW_VERSION}.git.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


prepare() {
  cd "${srcdir}/${_gitname}"

  git submodule init
  git config submodule.shFlags.url "$srcdir/shFlags"
  git -c protocol.file.allow=always submodule update
}


package() {
  cd "${srcdir}/${_gitname}"
  make install prefix="${pkgdir}/usr/local"
}
