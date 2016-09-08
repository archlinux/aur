# Context from Git mirror
# Maintainer: Philipp Gesang <phg@phi-gamma.net>
pkgname=context-git
pkgver=e2902f3
pkgrel=1
pkgdesc="The ConTeXt typesetting system; sources from Git"
arch=(any)
url="http://pragma-ade.nl"
license=('GPL2')
makedepends=('git' 'luatex-svn')
conflicts=(context-minimals-git)
sha256sums=('SKIP')

_git_repo=bitbucket.org/phg/context-mirror.git
_git_branch=beta
_git_checkout=context-mirror-git
source=("${_git_checkout}::git+https://${_git_repo}#branch=${_git_branch}")

pkgver() {
  cd "${_git_checkout}"
  # no tags in mirror repo
  git describe --always
}

build() {
  cd "${srcdir}"
  if [[ ! -d "${_git_checkout}" ]]; then
    msg "expected repo checkout at ${srcdir}/${_git_checkout}"
    exit -1
  fi
}

package() {
  local subdirs=( bibtex colors context doc fonts metapost scripts tex web2c )
  local dst="${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${dst}"

  cd "${srcdir}"
  for dir in ${subdirs[@]} ; do
    cp -ra "${_git_checkout}/${dir}" "${dst}/"
  done
}

# vim:ft=sh:et:sw=2:ts=8
