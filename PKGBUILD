# Maintainer: Tatsunori Aoki <ginjiro.135 [at] gmail.com>
# Contributor: @kunst1080

## インストールディレクトリを変更したい場合、次の変数の値を任意のパスに書き換えること。
LOCALBASE='/usr/local'

##################################################

pkgname='open-usp-tukubai-git'
pkgver='dev'
pkgrel='2'
pkgdesc='An open source version of shell commands usp Tukubai.'
url='https://github.com/usp-engineers-community/Open-usp-Tukubai'
arch=('any')
license=('MIT' 'custom')
install=${pkgname}.install
depends=('python2' 'git')
conflicts=('open-usp-tukubai')
source=("$(echo ${pkgname} | sed 's/-git$//')::git://github.com/usp-engineers-community/Open-usp-Tukubai.git")
md5sums=('SKIP')

reponame=$(echo ${pkgname} | sed 's/-git$//')

pkgver() {
  cd ${reponame}
  commit_date=$(git log -1 --format='%ci' | awk 'gsub(/-/, "", $1) && $0=$1"."')
  rev=$(git rev-list --count HEAD | sed 's/^/rev/')
  echo $commit_date$rev
}

build() {
  cd "${srcdir}/${reponame}/COMMANDS"
  find . -type f | xargs -n 1 sed -i '1s/python/&2/'
}

package() {
  cd ${srcdir}/${reponame}
  install -d ${pkgdir}${LOCALBASE}/bin
  install -d ${pkgdir}${LOCALBASE}/share/open-usp-tukubai/devel/pdf
  install -d ${pkgdir}${LOCALBASE}/share/open-usp-tukubai/devel/html
  install -d ${pkgdir}${LOCALBASE}/share/open-usp-tukubai/devel/man
  install -d ${pkgdir}${LOCALBASE}/share/open-usp-tukubai/devel/doc
  make LOCALBASE=${pkgdir}${LOCALBASE} install
}

# vim:set ts=2 sw=2 et:
